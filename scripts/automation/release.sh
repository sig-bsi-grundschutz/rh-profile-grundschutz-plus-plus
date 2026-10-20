#!/bin/bash
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=profile_names.sh
source "$SCRIPT_DIR/profile_names.sh"
# shellcheck source=../../config.env
source "$SCRIPT_DIR/../../config.env"

profile_names=()
while IFS= read -r line; do
	[ -n "$line" ] && profile_names+=("$line")
done < <(list_profiles)

if [ ${#profile_names[@]} -eq 0 ]; then
	echo "no profile present -> nothing to do"
	exit 0
fi

next_version=$(semantic-release version --print 2>/dev/null || true)
last_version=$(semantic-release version --print-last-released 2>/dev/null || true)
# Match v7: empty VERSION_TAG when nothing to release.
# Untagged repos: PSR prints 0.0.0 with no bump commits — skip that stamp.
if [ "$next_version" = "$last_version" ] || { [ -z "$last_version" ] && [ "$next_version" = "0.0.0" ]; }; then
	version_tag=""
else
	version_tag="$next_version"
fi
echo "Bumping version of profiles to ${version_tag}"
export VERSION_TAG="$version_tag"
if [ -n "${GITHUB_ENV:-}" ]; then
	echo "VERSION_TAG=${VERSION_TAG}" >> "$GITHUB_ENV"
fi

# Per-profile: regenerate any profile that has JSON but no md_profiles/<name>/
missing_md=()
for name in "${profile_names[@]}"; do
	if ! has_md_profile "$name"; then
		missing_md+=("$name")
	fi
done
if [ ${#missing_md[@]} -gt 0 ]; then
	echo "Regenerating profiles missing markdown: ${missing_md[*]}"
	"$SCRIPT_DIR/regenerate_profiles.sh" "${missing_md[@]}"
fi

# Assemble all profiles (fail closed on any error)
"$SCRIPT_DIR/assemble_profiles.sh"

git config --global user.email "$EMAIL"
git config --global user.name "$NAME"
# --no-push/--no-vcs-release: push.sh commits profile updates and moves the tag.
if [ -n "$version_tag" ]; then
	semantic-release version --no-push --no-vcs-release
fi
