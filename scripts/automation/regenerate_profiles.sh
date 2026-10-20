#!/bin/bash
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=profile_names.sh
source "$SCRIPT_DIR/profile_names.sh"
# shellcheck source=../../config.env
source "$SCRIPT_DIR/../../config.env"

# Optional args: profile names. Default = all discovered profiles.
if [ "$#" -gt 0 ]; then
	names=("$@")
else
	names=()
	while IFS= read -r line; do
		[ -n "$line" ] && names+=("$line")
	done < <(list_profiles)
fi

if [ ${#names[@]} -eq 0 ]; then
	echo "No profiles to regenerate"
	exit 0
fi

for name in "${names[@]}"; do
	[ -n "$name" ] || continue
	echo "Regenerating ${name}"
	trestle author profile-generate --name "$name" --output "md_profiles/$name"
done
