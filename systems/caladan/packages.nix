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
  inputPackage = lib.mapAttrs (_: value: value.packages.default) inputs';
in
{
  environment.systemPackages = with pkgs; [
    nixfmt
    statix
    deadnix

    nix-output-monitor
    nix-melt

    fnm
    deno
    bun

    uv
    ruff
    yt-dlp
    xkcdpass

    doggo
    doppler
    dprint
    dust
    fd
    hyperfine
    jq
    just
    reuse
    ripgrep
    shellcheck
    tokei
    vhs
    watchexec

    curl
    xh

    exiftool
    ffmpeg
    typst

    inputPackage.nrr
    inputPackage.am
    inputPackage.morlana
    inputPackage.moldau
    inputPackage.arkencrab
  ];
}
