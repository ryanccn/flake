{
  description = "Ryan's MacBook Pro flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    attic = {
      url = "github:zhaofengli/attic";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs";
      inputs.flake-compat.follows = "flake-compat";
    };

    catppuccin = {
      url = "github:Stonks3141/ctp-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-compat.follows = "flake-compat";
    };

    discord-applemusic-rich-presence = {
      url = "github:ryanccn/discord-applemusic-rich-presence";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    attic,
    catppuccin,
    discord-applemusic-rich-presence,
    ...
  }: let
    configuration = {pkgs, ...}:
      import ./system.nix (nixpkgs.lib.recursiveUpdate inputs {inherit pkgs;});
  in {
    darwinConfigurations.Ryans-MacBook-Pro = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        home-manager.darwinModules.home-manager
      ];
    };

    darwinPackages = self.darwinConfigurations.Ryans-MacBook-Pro.pkgs;
  };
}
