{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    inputs.home-manager.packages.${pkgs.system}.home-manager

    nil
    statix
    deadnix
    alejandra
    nixpkgs-fmt

    nix-your-shell
    nix-melt
    cachix
    direnv
    fh

    rustc
    cargo
    # sccache

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

    rust-analyzer
    nodePackages.typescript-language-server
    rustfmt
    clippy
    dprint

    google-cloud-sdk
    railway
    cloudflared
    flyctl
    pscale

    age
    bat
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
    silicon
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
