{
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
      package = pkgs.neovim-nightly;
      defaultEditor = true;
    };
    xdg.configFile."nvim/init.lua".source = ./init.lua;
  };
}
