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

    uv
    ruff
    yt-dlp

    doggo
    doppler
    dprint
    fd
    hyperfine
    jq
    just
    reuse
    ripgrep
    shellcheck
    tokei
    watchexec

    curl
    xh

    gnupg
    exiftool
    ffmpeg
    pandoc

    inputPackage.nrr
    inputPackage.morlana
    inputPackage.moldau
  ];
}
