{ inputs, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      shell = "${pkgs.zsh}/bin/zsh";
    };
    font.name = "TX-02";
  };
}
