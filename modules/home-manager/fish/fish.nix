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
        cali = "remind -g ~/cali/cal.rem";
        caliw = "remind -g -c+ ~/cali/cal.rem";
        calim = "remind -g -c ~/cali/cal.rem";
        patch32 = "patchelf --set-interpreter /home/eli/p/dpkg/libc6-i386/lib/i386-linux-gnu/ld-linux.so.2";
        run32 = "LD_LIBRARY_PATH=/home/eli/p/dpkg/libc6-i386/lib/i386-linux-gnu/";
      };
    };
  };
}
