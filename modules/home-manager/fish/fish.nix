{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    fish.enable = lib.mkEnableOption "fish";
  };

  config = {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        fish_vi_key_bindings
        set -U fish_greeting
      '';
      shellAliases = {
        ls = "eza -a --color=always";
        grep = "grep --color=always";
        ".." = "cd ..";
        rebuild = "~/soulfiles/scripts/rebuild.sh";
        ctf = "nix-shell --run fish ~/soulfiles/scripts/ctf.nix";
        cali = "remind ~/cali/cal.rem";
      };
    };
  };
}
