# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  lib,
  pkgs,
  inputs',
  ...
}:
let
  defaultPackages = lib.mapAttrs (_: value: value.packages.default) inputs';
in
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

    uv
    ruff
    yt-dlp
    xkcdpass

    # nodePackages.typescript-language-server
    dprint

    # google-cloud-sdk
    # railway
    # cloudflared
    # flyctl

    # btop
    doggo
    doppler
    dust
    fd
    ffmpeg
    # gum
    hyperfine
    jq
    just
    nerdfix
    reuse
    ripgrep
    tokei
    vhs
    vivid
    watchexec
    xh

    typst
    exiftool
    # packwiz
    # spicetify-cli

    defaultPackages.nrr
    defaultPackages.am
    defaultPackages.nyoom
    defaultPackages.morlana
    defaultPackages.spdx-gen
  ];
}
