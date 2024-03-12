{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    starship.enable = lib.mkEnableOption "starship";
  };

  config = {
    programs.starship = {
      enable = true;
      settings = {
        add_newline = false;
        line_break.disabled = true;
        character = {
          success_symbol = "[n ❯](bold green)";
          vicmd_symbol = "[v ❯](bold cyan)";
          error_symbol = "[x ❯](bold red)";
        };

        cmd_duration.min_time = 1000;

        directory.style = "purple";

        git_branch.style = "purple";

        git_status.style = "red";

        hostname = {
          ssh_only = true;
          format = "[$hostname](yellow) ";
          trim_at = ".local";
        };

        username = {
          style_root = "red";
          style_user = "yellow";
          format = "[$user]($style) ";
          show_always = true;
        };

        shell = {
          disabled = false;
          bash_indicator = "[b](bright-black)";
          fish_indicator = "[f](blue)";
          zsh_indicator = "[z](purple)";
          format = "$indicator ";
        };

        time.disabled = true;
      };
    };
  };
}
