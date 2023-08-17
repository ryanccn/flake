{
  pkgs,
  inputs,
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

    sccache
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

    age
    asciinema
    bat
    btop
    cloudflared
    doggo
    doppler
    du-dust
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
    mkcert
    nerdfix
    pscale
    railway
    ripgrep
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

    nyoom
    spicetify-cli
    exiftool
  ];

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  nix.settings = {
    experimental-features = "nix-command flakes";
    build-users-group = "nixbld";
    trusted-users = ["ryanccn"];
    auto-optimise-store = true;
    extra-platforms = ["x86_64-darwin" "aarch64-darwin"];

    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  nixpkgs = {
    overlays = [
      inputs.attic.overlays.default
      inputs.discord-applemusic-rich-presence.overlays.default
      inputs.nyoom.overlays.default
      (import ./overlays/ryan-mono-bin.nix)
    ];

    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };

  system.activationScripts.extraActivation = {
    text = ''
      set -eo pipefail
      HOME="/var/root" ${pkgs.lib.getExe' pkgs.nvd "nvd"} --nix-bin-dir=${pkgs.nix}/bin diff /run/current-system "$systemConfig"
    '';
  };

  security.pam.enableSudoTouchIdAuth = true;

  programs.fish.enable = true;
  programs.zsh.enable = true;

  homebrew = {
    enable = true;
    caskArgs.require_sha = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };

    casks = let
      noQuarantine = name: {
        inherit name;
        args = {no_quarantine = true;};
      };
    in [
      "blackhole-16ch"
      (noQuarantine "eloston-chromium")
      "sf-symbols"
      "1password/tap/1password-cli"
    ];

    taps = ["1password/tap"];
  };

  system.stateVersion = 4;
}
