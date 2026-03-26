{ inputs, ...}:
{
  imports = [
    ./git.nix
    ./neovim
    ./kitty.nix
    ./firefox.nix
    ./hyprland.nix
    ./emacs.nix
    ./zsh.nix
    ./starship.nix
    ./fzf.nix
    ./tmux.nix
    ./quickshell.nix
  ];
}
