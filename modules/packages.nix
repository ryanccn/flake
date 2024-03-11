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
    nix-output-monitor
    nix-melt
    # fh

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

    # btop
    doggo
    doppler
    du-dust
    fd
    ffmpeg
    gen-license
    gum
    hyperfine
    jq
    just
    minica
    nerdfix
    ripgrep
    tokei
    vhs
    vivid
    watchexec
    xh

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
