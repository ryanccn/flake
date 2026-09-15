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
  version = "2026.09.13";

  hashes = {
    "ryan-mono" = "sha256-5NgrYdofTD5qWABJ5BIhhQfahPnQXLXFpm4w1/TDue4=";
    "ryan-term" = "sha256-aYUBvcoqbQ2eJJ+D/1AzIGR956Mk/ODUj1GOs3G/Vtc=";
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
