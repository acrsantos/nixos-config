{ inputs, ... }:

{
  imports = [
    ./system.nix
    ./boot.nix
    ./packages.nix
    ./services.nix
    ./user.nix
    ./nvidia.nix
    ./network.nix
    ./fonts.nix
  ];
}
