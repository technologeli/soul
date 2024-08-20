{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    neovim.enable = lib.mkEnableOption "neovim";
  };

  config = {
    programs.neovim = {
      enable = true;
      package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
      defaultEditor = true;
    };
    xdg.configFile."nvim/init.lua".source = ./init.lua;
  };
}
