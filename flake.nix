{
  description = "Ryan's MacBook Pro flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    attic.url = "github:zhaofengli/attic";
    attic.inputs.nixpkgs.follows = "nixpkgs";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    catppuccin.url = "github:Stonks3141/ctp-nix";
  };

  outputs = {
    self,
    nix-darwin,
    home-manager,
    agenix,
    attic,
    catppuccin,
    ...
  }: let
    configuration = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        nil
        alejandra
        attic-client
        exa
        pkgs."_1password"
        age
        pkgs.agenix
        asciinema
        bat
        btop
        ccache
        ccacheWrapper
        cloudflared
        deno
        direnv
        doggo
        doppler
        du-dust
        exa
        exiftool
        fd
        ffmpeg
        fish
        flyctl
        fnm
        fzf
        go
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
        bun
        pipx
        pscale
        pyenv
        railway
        redis
        silicon
        starship
        tealdeer
        tokei
        # ttfautohint
        vhs
        vivid
        xh
        zoxide
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
      };

      nixpkgs = {
        overlays = [
          attic.overlays.default
          agenix.overlays.default
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
          nixpkgs.overlays = [attic.overlays.default];

          users.users.ryanccn.home = "/Users/ryanccn";
          home-manager.users.ryanccn = import ./home.nix;
        }
      ];
    };

    darwinPackages = self.darwinConfigurations.Ryans-MacBook-Pro.pkgs;
  };
}
