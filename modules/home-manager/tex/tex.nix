{
  pkgs,
  config,
  lib,
  ...
}: let
  tex = pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-full;
  };
in {
  options = {
    tex.enable = lib.mkEnableOption "tex";
  };

  config = {
    home.packages = with pkgs; [
      tex
    ];
  };
}
