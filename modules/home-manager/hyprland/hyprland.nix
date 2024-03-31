{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    hyprland.enable = lib.mkEnableOption "hyprland";
  };

  config = {
    xdg.configFile."hypr/hypridle.conf".text = ''
      listener {
          timeout = 150
          on-timeout = brightnessctl -s set 10
          on-resume = brightnessctl -r
      }

      listener {
          timeout = 300
          on-timeout = hyprlock
      }

      listener {
          timeout = 360
          on-timeout = hyprctl dispatch dpms off
          on-resume = hyprctl dispatch dpms on
      }

      listener {
          timeout = 1800
          on-timeout = systemctl suspend
      }
    '';

    xdg.configFile."hypr/hyprlock.conf".text = ''
      background {
          monitor =
          path = $HOME/Pictures/Wallpapers/gavin_odonnel/1.png
          color = rgba(25, 20, 20, 1.0)

          # all these options are taken from hyprland, see https://wiki.hyprland.org/Configuring/Variables/#blur for explanations
          blur_passes = 1 # 0 disables blurring
          blur_size = 7
          noise = 0.0117
          contrast = 0.8916
          brightness = 0.8172
          vibrancy = 0.1696
          vibrancy_darkness = 0.0
      }

      input-field {
          monitor =
          size = 200, 50
          outline_thickness = 3
          dots_size = 0.33 # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.15 # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = false
          dots_rounding = -1 # -1 default circle, -2 follow input-field rounding
          outer_color = rgb(151515)
          inner_color = rgb(200, 200, 200)
          font_color = rgb(10, 10, 10)
          fade_on_empty = true
          fade_timeout = 1000 # Milliseconds before fade_on_empty is triggered.
          placeholder_text = <i>Input Password...</i> # Text rendered in the input box when it's empty.
          hide_input = false
          rounding = -1 # -1 means complete rounding (circle/oval)
          check_color = rgb(204, 136, 34)
          fail_color = rgb(204, 34, 34) # if authentication failed, changes outer_color and fail message color
          fail_text = <i>$FAIL <b>($ATTEMPTS)</b></i> # can be set to empty
          fail_transition = 300 # transition time in ms between normal outer_color and fail_color

          position = 0, -20
          halign = center
          valign = center
      }

      label {
          monitor =
          text = Enter your password to unlock
          color = rgba(200, 200, 200, 1.0)
          font_size = 25
          font_family = Noto Sans

          position = 0, 200
          halign = center
          valign = center
      }
    '';
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      settings = {
        monitor = ",preferred,auto,1";
        "exec-once" = [
          "swaybg -i ~/Pictures/Wallpapers/gavin_odonnel/1.png"
          "nm-applet --indicator"
          "waybar"
          "mako"
          "hyprlock"
          "hypridle"
        ];
        "$rosewaterAlpha" = "f5e0dc";
        "$flamingoAlpha " = "f2cdcd";
        "$pinkAlpha     " = "f5c2e7";
        "$mauveAlpha    " = "cba6f7";
        "$redAlpha      " = "f38ba8";
        "$maroonAlpha   " = "eba0ac";
        "$peachAlpha    " = "fab387";
        "$yellowAlpha   " = "f9e2af";
        "$greenAlpha    " = "a6e3a1";
        "$tealAlpha     " = "94e2d5";
        "$skyAlpha      " = "89dceb";
        "$sapphireAlpha " = "74c7ec";
        "$blueAlpha     " = "89b4fa";
        "$lavenderAlpha " = "b4befe";

        "$textAlpha     " = "cdd6f4";
        "$subtext1Alpha " = "bac2de";
        "$subtext0Alpha " = "a6adc8";

        "$overlay2Alpha " = "9399b2";
        "$overlay1Alpha " = "7f849c";
        "$overlay0Alpha " = "6c7086";

        "$surface2Alpha " = "585b70";
        "$surface1Alpha " = "45475a";
        "$surface0Alpha " = "313244";

        "$baseAlpha     " = "1e1e2e";
        "$mantleAlpha   " = "181825";
        "$crustAlpha    " = "11111b";

        "$rosewater" = "0xfff5e0dc";
        "$flamingo " = "0xfff2cdcd";
        "$pink     " = "0xfff5c2e7";
        "$mauve    " = "0xffcba6f7";
        "$red      " = "0xfff38ba8";
        "$maroon   " = "0xffeba0ac";
        "$peach    " = "0xfffab387";
        "$yellow   " = "0xfff9e2af";
        "$green    " = "0xffa6e3a1";
        "$teal     " = "0xff94e2d5";
        "$sky      " = "0xff89dceb";
        "$sapphire " = "0xff74c7ec";
        "$blue     " = "0xff89b4fa";
        "$lavender " = "0xffb4befe";

        "$text     " = "0xffcdd6f4";
        "$subtext1 " = "0xffbac2de";
        "$subtext0 " = "0xffa6adc8";

        "$overlay2 " = "0xff9399b2";
        "$overlay1 " = "0xff7f849c";
        "$overlay0 " = "0xff6c7086";

        "$surface2 " = "0xff585b70";
        "$surface1 " = "0xff45475a";
        "$surface0 " = "0xff313244";

        "$base     " = "0xff1e1e2e";
        "$mantle   " = "0xff181825";
        "$crust    " = "0xff11111b";

        "$terminal" = "alacritty";
        "$fileManager" = "dolphin";
        "$menu" = "pkill rofi || rofi -show drun -show-icons";

        env = [
          "XCURSOR_SIZE,32"
          "QT_QPA_PLATFORMTHEME,qt6ct"
        ];

        input = {
          kb_layout = "us";
          kb_options = "altwin:swap_lalt_lwin,ctrl:nocaps";
          follow_mouse = "2";
          touchpad = {
            natural_scroll = "yes";
          };
          sensitivity = "0";
        };

        general = {
          gaps_in = "5";
          gaps_out = "10";
          border_size = "2";
          "col.active_border" = "$mauve $red 45deg";
          "col.inactive_border" = "$base";
          layout = "master";
          allow_tearing = "false";
        };

        decoration = {
          rounding = "6";
          blur = {
            enabled = "false";
            size = "3";
            passes = "1";
          };
          drop_shadow = "false";
          shadow_range = "4";
          shadow_render_power = "3";
          "col.shadow" = "$base";
        };

        animations = {
          enabled = "yes";
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
          ];
        };

        master = {
          new_is_master = "false";
          mfact = "0.5";
        };

        gestures = {
          workspace_swipe = "off";
        };

        misc = {
          force_default_wallpaper = "1";
          vfr = "true";
        };

        "$mainMod" = "SUPER";

        bind =
          [
            "$mainMod, Return, exec, $terminal"
            "$mainMod, Q, killactive, "
            "$mainMod, Escape, exit, "
            "$mainMod, E, exec, $fileManager"
            "$mainMod, V, togglefloating, "
            "$mainMod, C, exec, $terminal -e wyrd"
            "$mainMod, P, exec, $menu"

            "$mainMod, h, movefocus, l"
            "$mainMod, l, movefocus, r"
            "$mainMod, j, movefocus, d"
            "$mainMod, k, movefocus, u"

            "$mainMod CONTROL, h, swapwindow, l"
            "$mainMod CONTROL, l, swapwindow, r"
            "$mainMod CONTROL, j, swapwindow, d"
            "$mainMod CONTROL, k, swapwindow, u"
            "$mainMod, S, togglespecialworkspace, magic"
            "$mainMod SHIFT, S, movetoworkspace, special:magic"
            '',Print,exec,grim -l 0 -g "$(slurp -d)" - | wl-copy''
            ''Shift,Print,exec,grim -l 0 -g "$(slurp -d)"''
          ]
          ++ (
            builtins.concatLists (builtins.genList (
                x: let
                  ws = let
                    c = (x + 1) / 10;
                  in
                    builtins.toString (x + 1 - (c * 10));
                in [
                  "$mainMod, ${ws}, workspace, ${toString (x + 1)}"
                  "$mainMod CONTROL, ${ws}, movetoworkspace, ${toString (x + 1)}"
                ]
              )
              10)
          );

        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];

        bindel = [
          ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ];

        bindl = [
          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ];

        binde = [
          ",XF86MonBrightnessDown,exec,brightnessctl set 5%-"
          ",XF86MonBrightnessUp,exec,brightnessctl set 5%+"
        ];
      };
    };

    xdg.portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
      config.common.default = "*";
    };

    home.packages = with pkgs; [
      mako
      wl-clipboard
      swaybg
      rofi-wayland
      networkmanagerapplet
      grim
      slurp
      brightnessctl
      hypridle
      hyprlock
      libnotify
    ];
  };
}
