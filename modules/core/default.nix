{ inputs, ... }:

{
  imports = [
    ./packages.nix
    ./user.nix
    ./network.nix
    ./fonts.nix
  ];
}
