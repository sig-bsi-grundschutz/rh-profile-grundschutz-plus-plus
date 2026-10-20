#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=profile_names.sh
source "$SCRIPT_DIR/profile_names.sh"

profile_names=()
while IFS= read -r line; do
	[ -n "$line" ] && profile_names+=("$line")
done < <(list_profiles)

if [ ${#profile_names[@]} -gt 0 ]; then
	echo "profile(s) exist (${profile_names[*]}), exit 1"
	exit 1
else
	echo "no profile present, exit 0"
	exit 0
fi
