{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    waybar.enable = lib.mkEnableOption "waybar";
  };

  config = {
    programs.waybar = {
      enable = true;
      settings = [
        {
          layer = "top";
          position = "top";
          margin = "10px 10px 0px";
          modules-left = ["hyprland/workspaces"];
          modules-right = ["idle_inhibitor" "pulseaudio" "battery" "clock" "tray"];
          "hyprland/workspaces" = {
            format = "{icon}";
            format-icons = {
              default = "◉";
              empty = "○";
            };
            persistent-workspaces = {
              "*" = 10;
            };
          };
          "clock" = {
            format = "🕗 {:%I:%M %p}";
            tooltip = true;
            tooltip-format = "<big>{:%A, %B %d %Y }</big>\r<tt><small>{calendar}</small></tt>";
          };
          "battery" = {
            format = "🔋 {capacity} %";
          };
          "pulseaudio" = {
            format = "🔊 {volume}%";
          };
          "idle_inhibitor" = {
            format = "{icon}";
            format-icons = {
              activated = "🗲";
              deactivated = "⏾";
            };
            tooltip-format-activated = "Idle Inhibitor: Active";
            tooltip-format-deactivated = "Idle Inhibitor: Inactive";
          };
        }
      ];
      style = ''
        @define-color base   #1e1e2e;
        @define-color mantle #181825;
        @define-color crust  #11111b;

        @define-color text     #cdd6f4;
        @define-color subtext0 #a6adc8;
        @define-color subtext1 #bac2de;

        @define-color surface0 #313244;
        @define-color surface1 #45475a;
        @define-color surface2 #585b70;

        @define-color overlay0 #6c7086;
        @define-color overlay1 #7f849c;
        @define-color overlay2 #9399b2;

        @define-color blue      #89b4fa;
        @define-color lavender  #b4befe;
        @define-color sapphire  #74c7ec;
        @define-color sky       #89dceb;
        @define-color teal      #94e2d5;
        @define-color green     #a6e3a1;
        @define-color yellow    #f9e2af;
        @define-color peach     #fab387;
        @define-color maroon    #eba0ac;
        @define-color red       #f38ba8;
        @define-color mauve     #cba6f7;
        @define-color pink      #f5c2e7;
        @define-color flamingo  #f2cdcd;
        @define-color rosewater #f5e0dc;

        * {
            font-size: 14px;
            font-family: Hack, sans-serif;
            font-weight: bold;
        }

        window#waybar {
            background-color: alpha(@base, 0.75);
            color: @text;
            border-radius: 6px;
        }

        window#waybar.hidden {
            opacity: 0.2;
        }

        button {
            /* Use box-shadow instead of border so the text isn't offset */
            /* Avoid rounded borders under each button name */
            border: none;
            border-radius: 0;
        }
        button:hover {
            background: inherit;
        }

        #workspaces button {
            padding: 0 5px;
            background-color: transparent;
            color: @text;
            border-radius: 6px;
        }

        #workspaces button.active {
            background-color: @mauve;
            color: @base;
        }

        #workspaces button.urgent {
            background-color: @red;
            color: @base;
        }

        #clock,
        #battery,
        #cpu,
        #memory,
        #disk,
        #temperature,
        #backlight,
        #network,
        #pulseaudio,
        #wireplumber,
        #custom-media,
        #tray,
        #mode,
        #idle_inhibitor,
        #scratchpad,
        #power-profiles-daemon,
        #mpd {
            padding: 2px 10px 0;
            color: @text;
        }

        #window,
        #workspaces {
            margin: 0 4px;
        }

        /* If workspaces is the leftmost module, omit left margin */
        .modules-left > widget:first-child > #workspaces {
            margin-left: 0;
        }

        /* If workspaces is the rightmost module, omit right margin */
        .modules-right > widget:last-child > #workspaces {
            margin-right: 0;
        }

        #battery.charging, #battery.plugged {
            color: @base;
            background-color: @green;
        }

        @keyframes blink {
            to {
                background-color: @text;
                color: @base;
            }
        }

        /* Using steps() instead of linear as a timing function to limit cpu usage */
        #battery.critical:not(.charging) {
            background-color: @red;
            color: @base;
            animation-name: blink;
            animation-duration: 0.5s;
            animation-timing-function: steps(12);
            animation-iteration-count: infinite;
            animation-direction: alternate;
        }
      '';
    };
  };
}
