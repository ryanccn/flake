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

    lix = {
      url = "git+https://git.lix.systems/lix-project/lix?ref=refs/tags/2.90-beta.1";
      flake = false;
    };

    lix-module = {
      url = "git+https://git.lix.systems/lix-project/nixos-module";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.lix.follows = "lix";
      inputs.flake-utils.follows = "flake-utils";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
    };

    am = {
      url = "github:ryanccn/am";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nish = {
      url = "github:ryanccn/nish";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nrr = {
      url = "github:ryanccn/nrr";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.rust-overlay.follows = "rust-overlay";
      inputs.flake-utils.follows = "flake-utils";
    };

    choirpack = {
      url = "github:ryanccn/choirpack";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nyoom = {
      url = "https://flakehub.com/f/ryanccn/nyoom/0.*.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin-custom-icons = {
      url = "github:ryanccn/nix-darwin-custom-icons";
    };

    ohmyzsh = {
      url = "github:ohmyzsh/ohmyzsh";
      flake = false;
    };

    vivid-zsh = {
      url = "github:ryanccn/vivid-zsh";
      flake = false;
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs =
    {
      self,
      nix-darwin,
      home-manager,
      darwin-custom-icons,
      ...
    }@inputs:
    {
      darwinConfigurations.Ryans-MacBook-Pro = nix-darwin.lib.darwinSystem {
        modules = [
          home-manager.darwinModules.home-manager
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
