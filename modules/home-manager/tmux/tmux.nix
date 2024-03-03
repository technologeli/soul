{ pkgs, config, lib, ... }: {

  options = {
    tmux.enable = lib.mkEnableOption "tmux";
  };

  config = {
    programs.tmux = {
      enable = true;
      baseIndex = 1;
      escapeTime = 0;
      prefix = "C-g";
      shell = "${pkgs.fish}/bin/fish";
      terminal = "screen-256color";
      extraConfig = ''

        # https://github.com/alacritty/alacritty/issues/6869#issuecomment-1515283335
        set-option -ga terminal-overrides "alacritty:Tc"

        bind-key -r f run-shell "tmux neww ~/tmux-sessionizer"

        # https://unix.stackexchange.com/questions/564149/replace-clipboard-content-instead-of-appending-when-copying-from-tmux
        set -g mouse on
        bind-key -T copy-mode-vi MouseDragEnd1Pane send -X copy-pipe-and-cancel "xsel -b"
        bind-key -n -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "xsel -b"

        # catppuccin
        thm_bg="#1e1e2e"
        thm_fg="#cdd6f4"
        thm_cyan="#89dceb"
        thm_black="#181825"
        thm_gray="#313244"
        thm_magenta="#cba6f7"
        thm_pink="#f5c2e7"
        thm_red="#f38ba8"
        thm_green="#a6e3a1"
        thm_yellow="#f9e2af"
        thm_blue="#89b4fa"
        thm_orange="#fab387"
        thm_black4="#585b70"

        set-option -g status-style bg="$thm_bg",fg="$thm_fg"
        set-window-option -g window-status-separator ""
        set-option -g status-left "#[bg=$thm_blue,bold,fg=$thm_black] #S "
        set-option -g status-right "#[bg=$thm_blue,bold,fg=$thm_black]#(date +\" %a, %b %d %I:%M %p \")"
        set-option -g window-status-format " #I:#W "
        set-option -g window-status-current-format "#[bg=$thm_black4,fg=$thm_fg] #I:#W "
      '';
    };
    home.file."tmux-sessionizer".source = ./tmux-sessionizer;
  };
}
