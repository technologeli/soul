{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    git.enable = lib.mkEnableOption "git";
  };

  config = {
    programs.git = {
      enable = true;
      userName = "Elijah Lieu";
      userEmail = "50640682+technologeli@users.noreply.github.com";
      extraConfig = {
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
      };
    };
  };
}
