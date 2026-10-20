#!/bin/bash
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=profile_names.sh
source "$SCRIPT_DIR/profile_names.sh"

CHANGES=$(git diff-tree --no-commit-id --name-only -r HEAD)

regen_list=""
assemble_list=""

md1=$"^md_profiles/"
md2=$"\.md$"

json1=$"^profiles/"
json2=$"\.json$"

for val in ${CHANGES} ; do
	if [[ $val =~ $json1 && $val =~ $json2 ]]; then
		name=$(profile_from_path "$val")
		if [ -n "$name" ]; then
			regen_list="${regen_list}${name}"$'\n'
		fi
	fi

	if [[ $val =~ $md1 && $val =~ $md2 ]]; then
		name=$(profile_from_path "$val")
		if [ -n "$name" ]; then
			assemble_list="${assemble_list}${name}"$'\n'
		fi
	fi
done

# Unique sorted names
regen_names=()
while IFS= read -r line; do
	[ -n "$line" ] && regen_names+=("$line")
done < <(printf '%s' "$regen_list" | sort -u)

assemble_names=()
while IFS= read -r line; do
	[ -n "$line" ] && assemble_names+=("$line")
done < <(printf '%s' "$assemble_list" | sort -u)

echo "regen profiles: ${regen_names[*]:-none}"
echo "assemble profiles: ${assemble_names[*]:-none}"

if [ ${#regen_names[@]} -gt 0 ]; then
	echo "Json file(s) were changed, regenerating markdowns..."
	"$SCRIPT_DIR/regenerate_profiles.sh" "${regen_names[@]}"
fi

if [ ${#assemble_names[@]} -gt 0 ]; then
	echo "Md file(s) were changed, assembling profile..."
	"$SCRIPT_DIR/assemble_profiles.sh" "${assemble_names[@]}"
fi
