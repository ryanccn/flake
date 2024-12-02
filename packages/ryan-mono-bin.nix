{
  lib,
  stdenvNoCC,
  fetchzip,
}:
let
  version = "2024.11.18";

  hashes = {
    "RyanMono" = "sha256-c+NRiWMMZEmX2ImFpvSboPEKYPuBahYsjAzddsYi1Lo=";
    "RyanTerm" = "sha256-uYqK1ktgZPbhAOX3FyFWKDUSBDBQX6KtepT3PGcGuB0=";
    # "RyanMonoNerdFont" = "sha256-CKBgRHXw6U3PjXruHCE+YsksHn+hJGjwWwtS9CbGcXg=";
    # "RyanTermNerdFont" = "sha256-4GYYuZ//Ekk7jNi2zjxTMziaOOx4f2K17xcYIzOYAWc=";
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
