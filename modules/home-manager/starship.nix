{ pkgs, ... }: {
  home.packages = [
    pkgs.starship
  ];
  programs.starship = {
    enable = true;
    settings = {
# The main prompt format.
      format = "╭──\\(\[$username@\](bold cyan)\[$hostname\](bold blue)\\)-\\[$directory(\\]-\\[$git_branch$git_status$git_metrics)\\]\n╰─\[$character\](bold red) ";

# The format for the right-hand side of the prompt.
      right_format = "$cmd_duration$status";

# Configuration for the character symbol.
      character = {
        success_symbol = "[λ](bold cyan)";
        error_symbol = "[λ](bold red)";
      };

# Custom module for bolding text.
      custom.bold = {
        command = "printf \"\\033[1m\"";
        when = true;
        unsafe_no_escape = true;
        format = "$output";
      };

# Line break configuration.
      line_break = {
        disabled = false;
      };

# Username configuration.
      username = {
        format = "$user";
        disabled = false;
        show_always = true;
      };

# Nix shell configuration.
      nix_shell = {
        symbol = "❄️";
        format = "[$symbol $name](bold cyan)";
      };

# Hostname configuration.
      hostname = {
        ssh_only = false;
        format = "[$ssh_symbol](bold blue)$hostname";
        trim_at = ".companyname.com";
        disabled = false;
      };

# Directory configuration.
      directory = {
        truncation_length = 3;
        truncation_symbol = "…/";
        truncate_to_repo = true;
        style = "bold white";
        format = "[$path](bold blue)[$read_only]($read_only_style)";
      };

# Command duration configuration.
      cmd_duration = {
        min_time = 1000;
        style = "bold dimmed yellow";
        format = "◷[$duration]($style) ";
      };

# Git branch configuration.
      git_branch = {
        format = "[$symbol$branch(:$remote_branch)](bold yellow)";
      };

# Git status configuration.
      git_status = {
        format = "([ $all_status$ahead_behind](bold bright-blue))";
      };

# Git metrics configuration.
      git_metrics = {
        disabled = false;
        format = "( | [+$added]($added_style) )([-$deleted]($deleted_style))";
      };

# Shell configuration.
      shell = {
        fish_indicator = "󰈺";
        powershell_indicator = "_";
        bash_indicator = "$";
        zsh_indicator = "λ";
        unknown_indicator = "?";
        disabled = false;
        format = "[$indicator](bold)";
      };

# Status configuration.
      status = {
        disabled = false;
      };
    };
  };
         }
