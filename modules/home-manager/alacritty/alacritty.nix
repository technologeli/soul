{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    alacritty.enable = lib.mkEnableOption "alacritty";
  };

  config = {
    programs.alacritty = {
      enable = true;
      settings = {
        shell = "${pkgs.fish}/bin/fish";

        # window.decorations = "NONE";
        window.padding.x = 4;
        window.padding.y = 4;

        env.term = "xterm-256color";

        font = {
          normal.family = "Hack";
          normal.style = "Regular";
        };

        keyboard.bindings = [
          {
            key = "Back";
            mods = "Control";
            chars = "\x17";
          }
        ];

        colors = {
          primary = {
            background = "#1E1E2E"; # base
            foreground = "#CDD6F4"; # text
            # Bright and dim foreground colors
            dim_foreground = "#CDD6F4"; # text
            bright_foreground = "#CDD6F4"; # text
          };

          cursor = {
            text = "#1E1E2E"; # base
            cursor = "#F5E0DC"; # rosewater
          };

          vi_mode_cursor = {
            text = "#1E1E2E"; # base
            cursor = "#B4BEFE"; # lavender
          };

          # Search colors
          search.matches = {
            foreground = "#1E1E2E"; # base
            background = "#A6ADC8"; # subtext0
          };

          search.focused_match = {
            foreground = "#1E1E2E"; # base
            background = "#A6E3A1"; # green
          };

          footer_bar = {
            foreground = "#1E1E2E"; # base
            background = "#A6ADC8"; # subtext0
          };

          # Keyboard regex hints
          hints.start = {
            foreground = "#1E1E2E"; # base
            background = "#F9E2AF"; # yellow
          };

          hints.end = {
            foreground = "#1E1E2E"; # base
            background = "#A6ADC8"; # subtext0
          };

          # Selection colors
          selection = {
            text = "#1E1E2E"; # base
            background = "#F5E0DC"; # rosewater
          };

          # Normal colors
          normal = {
            black = "#45475A"; # surface1
            red = "#F38BA8"; # red
            green = "#A6E3A1"; # green
            yellow = "#F9E2AF"; # yellow
            blue = "#89B4FA"; # blue
            magenta = "#F5C2E7"; # pink
            cyan = "#94E2D5"; # teal
            white = "#BAC2DE"; # subtext1
          };

          # Bright colors
          bright = {
            black = "#585B70"; # surface2
            red = "#F38BA8"; # red
            green = "#A6E3A1"; # green
            yellow = "#F9E2AF"; # yellow
            blue = "#89B4FA"; # blue
            magenta = "#F5C2E7"; # pink
            cyan = "#94E2D5"; # teal
            white = "#A6ADC8"; # subtext0
          };

          # Dim colors
          dim = {
            black = "#45475A"; # surface1
            red = "#F38BA8"; # red
            green = "#A6E3A1"; # green
            yellow = "#F9E2AF"; # yellow
            blue = "#89B4FA"; # blue
            magenta = "#F5C2E7"; # pink
            cyan = "#94E2D5"; # teal
            white = "#BAC2DE"; # subtext1
          };
        };
      };
    };
  };
}
