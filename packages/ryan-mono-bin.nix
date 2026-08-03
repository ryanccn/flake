# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  lib,
  stdenvNoCC,
  fetchzip,
  installFonts,
}:
let
  version = "2026.05.23";

  hashes = {
    "ryan-mono" = "sha256-Z2TBc/B45Z5R69WKTLCxbqjrF2WrhLR5ENxd83GP2WU=";
    "ryan-term" = "sha256-tVK/uK9AMf0VytGHImIBQWKlHHCxRDXqGL0RsltgXCk=";
  };
in
stdenvNoCC.mkDerivation {
  pname = "ryan-mono-bin";
  inherit version;

  srcs = lib.mapAttrsToList (
    family: hash:
    fetchzip {
      name = "${family}-src";
      url = "https://github.com/ryanccn/ryan-mono/releases/download/v${version}/${family}.tar.xz";
      inherit hash;
    }
  ) hashes;

  sourceRoot = ".";
  nativeBuildInputs = [ installFonts ];

  meta = {
    description = "Ryan's homemade Iosevka build";
    homepage = "https://github.com/ryanccn/ryan-mono";
    platforms = lib.platforms.all;
    license = lib.licenses.ofl;
  };
}
