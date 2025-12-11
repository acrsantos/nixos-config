{ inputs, ...}:
{
  imports = [
    ./git.nix
    ./neovim.nix
    ./kitty.nix
    ./firefox.nix
    ./hyprland.nix
    ./kanshi.nix
    ./emacs.nix
    ./zsh.nix
    ./starship.nix
    ./fzf.nix
    ./tmux.nix
    ./quickshell.nix
  ];
}
