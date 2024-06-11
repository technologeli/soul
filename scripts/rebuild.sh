#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "Usage: rebuild <soul or spire>"
    exit 1
fi

set -e
pushd ~/soulfiles
$EDITOR
alejandra . &>/dev/null
git diff .
echo "NixOS Rebuilding..."
file_path="/home/eli/.mozilla/firefox/myprofile/containers.json"
tmp_path="/tmp/containers.json"
if [ -f "$file_path" ]; then
    mv "$file_path" "$tmp_path"
fi
git add .
sudo nixos-rebuild switch --upgrade --flake ~/soulfiles/#$1 &>nixos-switch.log || (
 cat nixos-switch.log | grep --color error && false)
if [ -f "$tmp_path" ]; then
    mv "$tmp_path" "$file_path"
fi
gen=$(nixos-rebuild list-generations | grep current)
git commit -am "$gen"
popd
notify-send -e "NixOS rebuild completed successfully."
