{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    tex.enable = lib.mkEnableOption "tex";
  };

  config = {
    programs.texlive.enable = true;
  };
}
