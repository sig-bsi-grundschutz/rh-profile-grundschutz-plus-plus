#!/bin/bash
# Local-only verification of multi-profile discovery, regen, and assemble.
# Uses test-data/profiles/ci-fixture-profile — does not leave it under profiles/.
# Usage (from repo root): ./scripts/automation/verify_multi_profile.sh
set -eo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$REPO_ROOT"

SCRIPT_DIR="$REPO_ROOT/scripts/automation"
# shellcheck source=profile_names.sh
source "$SCRIPT_DIR/profile_names.sh"

FIXTURE_NAME="ci-fixture-profile"
FIXTURE_SRC="test-data/profiles/${FIXTURE_NAME}"
REAL_NAME="gs-plusplus-rhel-host"

cleanup() {
	rm -rf "profiles/${FIXTURE_NAME}"
	rm -rf "md_profiles/${FIXTURE_NAME}"
}
trap cleanup EXIT

fail() {
	echo "VERIFY FAIL: $*" >&2
	exit 1
}

echo "=== verify_multi_profile: discovery helpers ==="

# Path mapping
got=$(profile_from_path "profiles/${FIXTURE_NAME}/profile.json")
[ "$got" = "$FIXTURE_NAME" ] || fail "profile_from_path profiles: expected ${FIXTURE_NAME}, got '${got}'"

got=$(profile_from_path "md_profiles/${FIXTURE_NAME}/ARCH.5/ARCH.5.2.md")
[ "$got" = "$FIXTURE_NAME" ] || fail "profile_from_path md_profiles: expected ${FIXTURE_NAME}, got '${got}'"

got=$(profile_from_path "README.md")
[ -z "$got" ] || fail "profile_from_path non-profile path should be empty, got '${got}'"

# Real profile must already be discoverable
found_real=0
while IFS= read -r line; do
	[ "$line" = "$REAL_NAME" ] && found_real=1
done < <(list_profiles)
[ "$found_real" -eq 1 ] || fail "expected ${REAL_NAME} in list_profiles before fixture install"

echo "=== verify_multi_profile: install fixture ==="
[ -f "${FIXTURE_SRC}/profile.json" ] || fail "missing ${FIXTURE_SRC}/profile.json"
cp -R "$FIXTURE_SRC" "profiles/${FIXTURE_NAME}"

found_fixture=0
found_real=0
while IFS= read -r line; do
	[ "$line" = "$FIXTURE_NAME" ] && found_fixture=1
	[ "$line" = "$REAL_NAME" ] && found_real=1
done < <(list_profiles)
[ "$found_fixture" -eq 1 ] || fail "fixture not listed by list_profiles"
[ "$found_real" -eq 1 ] || fail "real profile disappeared from list_profiles"

echo "=== verify_multi_profile: ensure trestle ==="
if ! command -v trestle >/dev/null 2>&1; then
	if [ -d .venv ]; then
		# shellcheck disable=SC1091
		source .venv/bin/activate
	else
		python3 -m venv .venv
		# shellcheck disable=SC1091
		source .venv/bin/activate
		pip install -r requirements.txt
	fi
fi
command -v trestle >/dev/null 2>&1 || fail "trestle not available after venv setup"

echo "=== verify_multi_profile: regenerate fixture only ==="
"$SCRIPT_DIR/regenerate_profiles.sh" "$FIXTURE_NAME"
[ -d "md_profiles/${FIXTURE_NAME}" ] || fail "md_profiles/${FIXTURE_NAME} not created"

# Real profile markdown must still exist and not be the only change target
[ -d "md_profiles/${REAL_NAME}" ] || fail "md_profiles/${REAL_NAME} missing after fixture regen"

echo "=== verify_multi_profile: assemble fixture only ==="
"$SCRIPT_DIR/assemble_profiles.sh" "$FIXTURE_NAME"
[ -f "profiles/${FIXTURE_NAME}/profile.json" ] || fail "fixture profile.json missing after assemble"

echo "=== verify_multi_profile: check_profile exit code ==="
set +e
"$SCRIPT_DIR/check_profile.sh"
rc=$?
set -e
[ "$rc" -eq 1 ] || fail "check_profile.sh should exit 1 when profiles exist (got ${rc})"

echo "=== verify_multi_profile: OK ==="
# trap cleanup removes fixture on exit
