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
    statix
    deadnix

    nix-your-shell
    nix-output-monitor
    nix-melt

    fnm
    # deno (hydra build failure)
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
    nerdfix
    reuse
    ripgrep
    tokei
    vhs
    vivid
    watchexec
    xh

    exiftool
    ffmpeg
    typst

    defaultPackages.nrr
    defaultPackages.am
    defaultPackages.nyoom
    defaultPackages.morlana
    defaultPackages.spdx-gen
    defaultPackages.moldau
    defaultPackages.arkencrab
  ];
}
