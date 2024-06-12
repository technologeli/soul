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
        commit.gpgsign = true;
        user.signingkey = "29D83C30B25FF351";
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
      };
    };
  };
}
