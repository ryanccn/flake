{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    inputs.home-manager.packages.${pkgs.system}.home-manager

    alejandra
    nixpkgs-fmt
    statix
    deadnix

    nix-your-shell
    nix-melt
    direnv
    fh

    (fenix.combine (
      with fenix;
      with stable; [
        cargo
        rustc
        rustfmt
        clippy
        rust-src
        rust-docs
        targets.wasm32-unknown-unknown.stable.rust-std
      ]
    ))

    fnm
    deno
    bun

    (python311.withPackages (ps: with ps; [pip]))
    ruff
    yt-dlp
    xkcdpass
    pipreqs

    libffi
    openssl

    nodePackages.typescript-language-server
    dprint

    google-cloud-sdk
    railway
    cloudflared
    flyctl
    pscale

    btop
    doggo
    doppler
    du-dust
    fd
    ffmpeg
    fzf
    gh
    gen-license
    gum
    hyperfine
    jq
    just
    mkcert
    nerdfix
    ripgrep
    tealdeer
    tokei
    vhs
    vivid
    watchexec
    xh
    zoxide

    typst

    packwiz
    catppuccin-catwalk

    am
    nish
    nrr
    choirpack
    nyoom

    spicetify-cli
    exiftool
  ];
}
