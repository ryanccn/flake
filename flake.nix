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

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.0.tar.gz";
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
  };

  outputs =
    {
      self,
      nix-darwin,
      lix-module,
      home-manager,
      nix-index-database,
      darwin-custom-icons,
      ...
    }@inputs:
    {
      darwinConfigurations.Ryans-MacBook-Pro = nix-darwin.lib.darwinSystem {
        modules = [
          lix-module.nixosModules.default
          home-manager.darwinModules.home-manager
          nix-index-database.darwinModules.nix-index
          darwin-custom-icons.darwinModules.default
          ./system.nix
        ];

        specialArgs = {
          inherit self inputs;
        };
      };

      overlays = import ./overlays;
    };
}
