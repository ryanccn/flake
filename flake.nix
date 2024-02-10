{
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

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-compat.follows = "";
    };

    catppuccin = {
      url = "github:Stonks3141/ctp-nix";
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
    };

    choirpack = {
      url = "github:ryanccn/choirpack";
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
      inputs.flake-compat.follows = "";
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

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      src = ./.;

      system.modules.darwin = with inputs; [
        home-manager.darwinModules.home-manager
        darwin-custom-icons.darwinModules.default
      ];
    };
}
