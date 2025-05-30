# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  lib,
  stdenvNoCC,
  fetchzip,
}:
let
  version = "2025.04.28";

  hashes = {
    "ryan-mono" = "sha256-UPw0L5j7h9YcmI1nvgqg0kgYKLi8Ip4ghYzwpanoaqE=";
    "ryan-term" = "sha256-uu6lEfhtnAp8v50jvY9oXPnOFnDoIAWxxAAjNIXQbec=";
  };
in
stdenvNoCC.mkDerivation {
  pname = "ryan-mono-bin";
  inherit version;

  srcs = lib.mapAttrsToList (
    family: hash:
    fetchzip {
      url = "https://github.com/ryanccn/ryan-mono/releases/download/v${version}/${family}.tar.xz";
      inherit hash;
    }
  ) hashes;

  sourceRoot = ".";
  dontUnpack = true;

  installPhase = ''
    runHook preInstall
    find $srcs -type f -name '*.ttf' -exec install -Dm644 {} -t $out/share/fonts/truetype \;
    runHook postInstall
  '';

  meta = with lib; {
    description = "Ryan's homemade Iosevka build";
    homepage = "https://github.com/ryanccn/ryan-mono";
    platforms = platforms.all;
    license = licenses.ofl;
  };
}
