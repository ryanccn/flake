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
      url = "github:Stonks3141/ctp-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    am = {
      url = "github:ryanccn/am";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nish = {
      url = "github:ryanccn/nish";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nyoom = {
      url = "https://flakehub.com/f/ryanccn/nyoom/0.*.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fh = {
      url = "https://flakehub.com/f/DeterminateSystems/fh/0.*.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.fenix.follows = "fenix";
      inputs.naersk.follows = "naersk";
      inputs.flake-compat.follows = "flake-compat";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };

    naersk = {
      url = "github:nix-community/naersk";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin-custom-icons = {
      url = "github:ryanccn/nix-darwin-custom-icons";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = {
    self,
    nix-darwin,
    home-manager,
    darwin-custom-icons,
    ...
  } @ inputs: {
    darwinConfigurations.Ryans-MacBook-Pro = nix-darwin.lib.darwinSystem {
      modules = [
        home-manager.darwinModules.home-manager
        darwin-custom-icons.darwinModules.default
        ./system.nix
      ];

      specialArgs = {
        inherit inputs;
      };
    };

    checks = {
      aarch64-darwin =
        builtins.mapAttrs (
          _: v:
            builtins.seq
            v.config.system.build.toplevel
            v.pkgs.emptyFile
        )
        self.darwinConfigurations;
    };
  };
}
