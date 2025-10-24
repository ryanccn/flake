# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      imports = [
        ./checks
        ./packages
        ./systems
      ];
    };

  inputs = {
    nixpkgs = {
      url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    am = {
      url = "github:ryanccn/am";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.ferrix.follows = "ferrix";
    };

    nrr = {
      url = "github:ryanccn/nrr";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.ferrix.follows = "ferrix";
    };

    nyoom = {
      url = "github:ryanccn/nyoom";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.ferrix.follows = "ferrix";
    };

    morlana = {
      url = "github:ryanccn/morlana";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.ferrix.follows = "ferrix";
    };

    spdx-gen = {
      url = "github:ryanccn/spdx-gen";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.ferrix.follows = "ferrix";
    };

    moldau = {
      url = "github:ryanccn/moldau";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.ferrix.follows = "ferrix";
    };

    arkencrab = {
      url = "github:ryanccn/arkencrab";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.ferrix.follows = "ferrix";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ferrix = {
      url = "github:ryanccn/ferrix";
    };
  };
}
