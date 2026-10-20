#!/bin/bash
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=profile_names.sh
source "$SCRIPT_DIR/profile_names.sh"
# shellcheck source=../../config.env
source "$SCRIPT_DIR/../../config.env"

# Optional args: profile names. Default = all md_profiles dirs.
# Version stamp: VERSION_TAG env (set by release.sh) when non-empty.
if [ "$#" -gt 0 ]; then
	names=("$@")
else
	names=()
	while IFS= read -r line; do
		[ -n "$line" ] && names+=("$line")
	done < <(list_md_profiles)
fi

if [ ${#names[@]} -eq 0 ]; then
	echo "No profiles to assemble"
	exit 0
fi

version_tag="${VERSION_TAG:-}"

for name in "${names[@]}"; do
	[ -n "$name" ] || continue
	if ! has_md_profile "$name"; then
		echo "error: md_profiles/${name} missing; cannot assemble" >&2
		exit 1
	fi
	if [ -n "${version_tag}" ]; then
		echo "Assembling ${name} with version ${version_tag}"
		trestle author profile-assemble --markdown "md_profiles/$name" --output "$name" --version "$version_tag"
	else
		echo "Assembling ${name}"
		trestle author profile-assemble --markdown "md_profiles/$name" --output "$name"
	fi
done
