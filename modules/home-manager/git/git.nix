{ pkgs, config, lib, ... }: {

  options = {
    git.enable = lib.mkEnableOption "neovim";
  };

  config = {
    programs.git = {
      enable = true;
      userName = "Elijah Lieu";
      userEmail = "elijahlieu@protonmail.com";
      extraConfig = {
          init.defaultBranch = "main";
      };
    };
  };
}
