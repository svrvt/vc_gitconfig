#!/bin/bash
# https://stackoverflow.com/questions/27249629/environment-variables-in-git-config

hostname=$(hostname)

declare -A key_arr
key_arr[vaio]=F217A2E9
key_arr[aldebaran]=668D8525

key_for_host="${key_arr[$hostname]}"

cat <<EOF >"$HOME"/.gitconfig.local
# This gitconfig was generated via "$(realpath "$0")"
# Edit that file, not this one!

[user]
    name = Rustam Uzairov
    email = svrvt.zrv@gmail.com
    signingkey = $key_for_host
    
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
