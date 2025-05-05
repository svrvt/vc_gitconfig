#!/bin/bash
# https://stackoverflow.com/questions/27249629/environment-variables-in-git-config

hostname=$(hostname)

declare -A key_arr
key_arr[vaio]=F217A2E9
key_arr[aldebaran]=668D8525
key_arr[vaio-p]=ED3FA43A

key_for_host="${key_arr[$hostname]}"

cat <<EOF >"$HOME"/.gitconfig.local
# This gitconfig was generated via "$(realpath "$0")"
# Edit that file, not this one!

[user]
    name = Rustam Uzairov
    email = svrvt.zrv@gmail.com
    signingkey = $key_for_host
EOF

if ssh -T git@github.com 2>&1 | grep -q "successfully authenticated"; then
	# if ! grep -qE '[url "git@github.com:"]+[insteadOf = https://github.com/]' .gitconfig; then
	if ! grep -q 'insteadOf = https://github.com/' ~/.gitconfig; then
		cat <<EOF >>"$HOME/.gitconfig.local"

# This string added via "$(realpath "$0")"
[url "git@github.com:"]
    insteadOf = https://github.com/
EOF
	fi
# else
# 	git config --global --remove-section url.git@github.com:
fi

cat <<EOF >>"$HOME"/.gitconfig.local

# vim: ft=ini
EOF



if ! grep -q "path = .gitconfig.local" ~/.gitconfig; then
	cat <<EOF >>"$HOME"/.gitconfig
[include]
  path = .gitconfig.local
EOF
fi

# if [[ -n "$(which gnome-keyring-daemon)" ]]; then
#   CREDENTIAL_HELPER="/usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring"
# fi

# if [[ -n "$CREDENTIAL_HELPER" ]]; then
#   cat <<EOF >> $HOME/.gitconfig
# [credential]
#   helper = $CREDENTIAL_HELPER
# EOF
# fi
