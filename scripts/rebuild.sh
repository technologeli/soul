#!/usr/bin/env bash
set -e
pushd ~/soulfiles
$EDITOR
alejandra . &>/dev/null
git diff -U0 .
echo "NixOS Rebuilding..."
rm ~/.mozilla/firefox/myprofile/containers.json
sudo nixos-rebuild switch --upgrade --flake ~/soulfiles/#soul &>nixos-switch.log || (
 cat nixos-switch.log | grep --color error && false)
gen=$(nixos-rebuild list-generations | grep current)
git commit -am "$gen"
popd
notify-send -e "NixOS rebuild completed successfully."
