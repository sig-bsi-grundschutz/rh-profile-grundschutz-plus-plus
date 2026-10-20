#!/bin/bash
# Shared helpers for multi-profile discovery and path mapping.
# Source from other automation scripts (do not execute directly).

# List profile names under profiles/ that contain profile.json.
# Skips .keep and non-directories. Prints one name per line.
list_profiles() {
	local dir name
	if [ ! -d profiles ]; then
		return 0
	fi
	for dir in profiles/*/; do
		[ -d "$dir" ] || continue
		name=$(basename "$dir")
		[ "$name" = "*" ] && continue
		[ -f "profiles/${name}/profile.json" ] || continue
		printf '%s\n' "$name"
	done
}

# List markdown profile names under md_profiles/ (directories only, skip .keep).
list_md_profiles() {
	local dir name
	if [ ! -d md_profiles ]; then
		return 0
	fi
	for dir in md_profiles/*/; do
		[ -d "$dir" ] || continue
		name=$(basename "$dir")
		[ "$name" = "*" ] && continue
		printf '%s\n' "$name"
	done
}

# Map a repo-relative path to a profile name.
# profiles/<name>/... or md_profiles/<name>/... → name; else empty.
profile_from_path() {
	local path="$1"
	# Strip leading ./ if present
	path="${path#./}"
	case "$path" in
		profiles/*|md_profiles/*)
			# Second path segment is the profile name
			printf '%s\n' "$path" | awk -F/ '{print $2}'
			;;
		*)
			printf '\n'
			;;
	esac
}

# True if md_profiles/<name> exists as a directory.
has_md_profile() {
	local name="$1"
	[ -d "md_profiles/${name}" ]
}
