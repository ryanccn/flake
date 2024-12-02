{
  description = "Ryan's MacBook Pro flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    am = {
      url = "github:ryanccn/am";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-filter.follows = "nix-filter";
    };

    nrr = {
      url = "github:ryanccn/nrr";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-filter.follows = "nix-filter";
    };

    nyoom = {
      url = "github:ryanccn/nyoom";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-filter.follows = "nix-filter";
    };

    morlana = {
      url = "github:ryanccn/morlana";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-filter.follows = "nix-filter";
    };

    spdx-gen = {
      url = "github:ryanccn/spdx-gen";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-filter.follows = "nix-filter";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin-custom-icons = {
      url = "github:ryanccn/nix-darwin-custom-icons";
    };

    nix-filter = {
      url = "github:numtide/nix-filter";
    };

    ohmyzsh = {
      url = "github:ohmyzsh/ohmyzsh";
      flake = false;
    };

    vivid-zsh = {
      url = "github:ryanccn/vivid-zsh";
      flake = false;
    };

    systems = {
      url = "github:nix-systems/default";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
      systems,
      ...
    }@inputs:
    let
      inherit (nixpkgs) lib;
      forAllSystems = lib.genAttrs (import systems);
    in
    {
      darwinConfigurations = {
        Ryans-MacBook-Pro = nix-darwin.lib.darwinSystem {
          modules = [
            ./modules/_module.nix
            ./system.nix
          ];

          specialArgs = {
            inherit self inputs;
          };
        };
      };

      packages = forAllSystems (system: (import ./packages) nixpkgs.legacyPackages.${system});
    };
}
