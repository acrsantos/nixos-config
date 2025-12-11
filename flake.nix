{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    dms.url = "github:AvengeMedia/DankMaterialShell";
  };

  outputs = inputs @ { 
    self,
    nixpkgs,
    home-manager,
    ... 
  }: let
    username = "adrian";
  in
  {
    imports = [ inputs.dms.homeModules.dankMaterialShell.default ];
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
        inherit username;
      };
      modules = [
        ./hosts/default
        ./modules/core
      ];
    };
  };
}
