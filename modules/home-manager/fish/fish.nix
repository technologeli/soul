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
      };
    };
  };
}
