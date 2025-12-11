{ inputs, ... }:

{
  imports = [
    ./hardware.nix
    ./system.nix
    ./boot.nix
    ./nvidia.nix
    ./services.nix
    ./sddm.nix
  ];
}
