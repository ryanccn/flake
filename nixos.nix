{
  pkgs,
  attic,
  catppuccin,
  discord-applemusic-rich-presence,
  nyoom,
  ...
}: {
  environment.systemPackages = with pkgs; [
    nil
    alejandra
    nixpkgs-fmt
    attic-client
    cachix
    direnv

    rustc
    cargo

    ccache
    deno
    fnm
    bun

    (python311.withPackages (ps:
      with ps; [
        pip
        yt-dlp
        xkcdpass
      ]))
    libffi
    openssl

    rust-analyzer
    nodePackages.typescript-language-server
    rustfmt
    clippy

    pkgs.nyoom

    age
    asciinema
    bat
    btop
    cloudflared
    doggo
    doppler
    du-dust
    exiftool
    fd
    ffmpeg
    flyctl
    fzf
    gh
    gen-license
    gum
    hyperfine
    jq
    just
    spicetify-cli
    mkcert
    nerdfix
    pscale
    railway
    silicon
    tealdeer
    tokei
    vhs
    vivid
    xh
    zoxide

    typst
    packwiz

    catppuccin-catwalk
    packwiz
  ];

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  nix.settings = {
    experimental-features = "nix-command flakes";
    build-users-group = "nixbld";
    trusted-users = ["ryanccn"];
    auto-optimise-store = true;
    extra-platforms = ["x86_64-linux" "aarch64-linux"];

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
      nyoom.overlays.default
      (import ./overlays/ryan-mono-bin.nix)
    ];

    config.allowUnfree = true;
    hostPlatform = "x86_64-linux";
  };

  system.activationScripts.extraActivation = {
    text = ''
      set -eo pipefail
      ${pkgs.lib.getExe pkgs.nvd} --nix-bin-dir=${pkgs.nix}/bin diff /run/current-system "$systemConfig"
    '';
  };

  programs.fish.enable = true;
  programs.zsh.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      ctpModule = catppuccin.homeManagerModules.catppuccin;
      discord-applemusic-rich-presence = discord-applemusic-rich-presence.homeManagerModules.default;
    };
  };

  users.users.ryanccn = {
    home = "/home/ryanccn";
  };

  home-manager.users.ryanccn = import ./home.nix;

  system.stateVersion = 4;
}
