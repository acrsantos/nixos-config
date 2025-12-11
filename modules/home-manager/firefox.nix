{ inputs, pkgs, ...}:

{
  home.packages = with pkgs; [
    # Add firefox-devedition to the list of packages
    firefox-devedition
  ];
}
