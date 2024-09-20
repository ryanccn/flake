{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nixfmt-rfc-style
    alejandra
    nixpkgs-fmt
    statix
    deadnix

    nix-your-shell
    nix-output-monitor
    nix-melt

    fnm
    deno
    bun

    (python312.withPackages (ps: with ps; [ pip ]))
    uv
    ruff
    yt-dlp
    xkcdpass

    nodePackages.typescript-language-server
    dprint

    # google-cloud-sdk
    railway
    cloudflared
    # flyctl

    # btop
    doggo
    doppler
    dust
    fd
    ffmpeg
    gum
    hyperfine
    jq
    just
    nerdfix
    ripgrep
    tokei
    vhs
    vivid
    watchexec
    xh

    typst
    packwiz
    # spicetify-cli
    exiftool

    nrr
    am
    nyoom
    morlana
    spdx-gen
  ];
}
