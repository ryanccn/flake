# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  lib,
  symlinkJoin,
  makeBinaryWrapper,
  helix,
  typescript-language-server,
  gopls,
  nil,
}:
let
  lsps = [
    typescript-language-server
    gopls
    nil
  ];
in
symlinkJoin {
  pname = "${helix.pname}-with-lsps";
  inherit (helix) version meta;
  paths = [ helix ];

  nativeBuildInputs = [ makeBinaryWrapper ];

  postBuild = ''
    wrapProgram $out/bin/${helix.meta.mainProgram} \
      --suffix PATH : "${lib.makeBinPath lsps}"
  '';
}
