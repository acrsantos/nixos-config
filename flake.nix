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
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";
    reaper-flake.url = "github:9Prestidigitator/reaper-flake";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    musnix = {
      url = "github:musnix/musnix";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      reaper-flake,
      nur,
      ...
    }:
    let
      username = "adrian";
      system = "x86_64-linux";
      pkgs-stable = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit nur;
          nixpkgs-stable = pkgs-stable;
        };
        modules = [
          inputs.musnix.nixosModules.musnix
          nur.modules.nixos.default
          ./hosts/laptop
          ./modules/core
        ];
      };
    };
}
