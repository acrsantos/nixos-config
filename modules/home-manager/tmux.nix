{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    plugins = with pkgs; [
      tmuxPlugins.yank
      tmuxPlugins.sensible

    ];
    extraConfig = ''
      set -g default-terminal "$TERM"
      set -ag terminal-overrides ",$TERM:Tc"
      set -g mouse on
      set -g base-index 1
      setw -g pane-base-index 1

      set -g status-left-length 40
      set -g status-right ""
      set -g status-left ""
      set -g window-status-current-format "#[fg=#E0E2EA,bg=default]  #W  "
      set -g window-status-format "#[fg=#444444,bg=default,nobold,noitalics,nounderscore]  #W  "
      set -g window-status-separator ""
      set -g renumber-windows on

      set-window-option -g mode-keys vi

      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel

      bind -n M-1 select-window -t :1
      bind -n M-2 select-window -t :2
      bind -n M-3 select-window -t :3
      bind -n M-4 select-window -t :4
      bind -n M-5 select-window -t :5
      bind -n M-6 select-window -t :6
      bind -n M-7 select-window -t :7
      bind -n M-8 select-window -t :8
      bind -n M-9 select-window -t :9
    '';
  };
}
