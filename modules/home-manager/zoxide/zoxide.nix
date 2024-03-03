{ pkgs, config, lib, ... }: {

  options = {
    zoxide.enable = lib.mkEnableOption "zoxide";
  };

  config = {
    programs.zoxide = {
      enable = true;
      options = [ "--cmd j" ];
    };
  };
}
