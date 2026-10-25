{ inputs, ... }:
{
  imports = [
    ./git.nix
    ./neovim
    ./ghostty
    ./kitty.nix
    ./firefox.nix
    # ./hyprland.nix
    # ./emacs.nix
    ./zsh.nix
    ./starship.nix
    ./fzf.nix
    ./reaper.nix
    ./tmux.nix
  ];
}
