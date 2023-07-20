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
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:Stonks3141/ctp-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nix-darwin,
    home-manager,
    agenix,
    fenix,
    attic,
    catppuccin,
    ...
  }: let
    configuration = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        nil
        alejandra
        attic-client
        cachix
        direnv

        fenix.packages.${system}.stable.defaultToolchain
        ccache
        ccacheWrapper
        deno
        fnm
        go
        bun

        pkgs."_1password"
        age
        pkgs.agenix
        asciinema
        bat
        btop
        cloudflared
        doggo
        doppler
        du-dust
        exa
        exiftool
        fd
        ffmpeg
        fish
        flyctl
        fzf
        gh
        git
        git-lfs
        gum
        helix
        hyperfine
        jq
        just
        spicetify-cli
        mkcert
        nerdfix
        opencv
        pipx
        pscale
        pyenv
        railway
        redis
        silicon
        starship
        tealdeer
        tokei
        vhs
        vivid
        xh
        zoxide

        (import ./pkgs/gen-license.nix {
          inherit (pkgs) lib stdenv rustPlatform fetchCrate darwin libiconv pkg-config;
        })
      ];

      services.nix-daemon.enable = true;
      nix.package = pkgs.nix;

      nix.settings = {
        experimental-features = "nix-command flakes";
        build-users-group = "nixbld";
        trusted-users = ["ryanccn"];
        auto-optimise-store = true;
        extra-platforms = ["x86_64-darwin" "aarch64-darwin"];

        extra-sandbox-paths = ["/nix/var/cache/ccache"];

        extra-substituters = [
          "https://nix-community.cachix.org"
        ];
        extra-trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];
      };

      nixpkgs = {
        overlays = [
          attic.overlays.default
          agenix.overlays.default
          fenix.overlays.default
          (import ./overlays/ccache-wrapper.nix)
        ];

        config.allowUnfree = true;
        hostPlatform = "aarch64-darwin";
      };

      programs.zsh.enable = true;
      programs.fish.enable = true;
      programs.fish.shellInit = ''
        for p in /run/current-system/sw/bin
          if not contains $p $fish_user_paths
            set -g fish_user_paths $p $fish_user_paths
          end
        end
      '';

      system.stateVersion = 4;
    };
  in {
    darwinConfigurations.Ryans-MacBook-Pro = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {
            agenixModule = agenix.homeManagerModules.age;
            ctpModule = catppuccin.homeManagerModules.catppuccin;
          };

          users.users.ryanccn.home = "/Users/ryanccn";
          home-manager.users.ryanccn = import ./home.nix;
        }
      ];
    };

    darwinPackages = self.darwinConfigurations.Ryans-MacBook-Pro.pkgs;
  };
}
