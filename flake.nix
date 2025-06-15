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
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
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
    };

    nrr = {
      url = "github:ryanccn/nrr";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nyoom = {
      url = "github:ryanccn/nyoom";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    morlana = {
      url = "github:ryanccn/morlana";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spdx-gen = {
      url = "github:ryanccn/spdx-gen";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    moldau = {
      url = "github:ryanccn/moldau";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    arkencrab = {
      url = "github:ryanccn/arkencrab";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
