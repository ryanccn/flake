{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nil
    statix
    deadnix
    alejandra
    nixpkgs-fmt

    nix-your-shell
    nix-melt
    attic-client
    cachix
    direnv
    fh

    rustc
    cargo
    sccache

    fnm
    deno
    bun

    (python311.withPackages (ps: with ps; [pip]))
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

    age
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
    watchexec
    xh
    zoxide

    typst

    packwiz
    catppuccin-catwalk

    am
    nyoom
    spicetify-cli
    exiftool
  ];
}
