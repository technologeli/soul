{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    sway.enable = lib.mkEnableOption "sway";
  };

  config = {
    xdg.configFile."sway/config".source = ./config;
  };
}
