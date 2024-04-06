(_: prev: let
  version = "2024.04.06";

  mkFontVariant = {
    variant,
    hash,
  }:
    prev.callPackage ({
      lib,
      fetchzip,
      stdenvNoCC,
    }:
      stdenvNoCC.mkDerivation {
        pname = variant;
        inherit version;

        src = fetchzip {
          url = "https://github.com/ryanccn/ryan-mono/releases/download/v${version}/${variant}.tar.xz";
          inherit hash;
        };

        buildPhase = ''
          mkdir -p "$out"/share/fonts/truetype
          cp *.ttf "$out"/share/fonts/truetype
        '';

        meta = with lib; {
          homepage = "https://github.com/ryanccn/ryan-mono";
          platforms = platforms.all;
          license = licenses.ofl;
        };
      }) {};
in {
  ryan-mono-bin = mkFontVariant {
    variant = "RyanMono";
    hash = "sha256-oqrG258ONpwekBdyBnxl9x+8wHlBaUpYoP4PIIeD4+4=";
  };

  ryan-term-bin = mkFontVariant {
    variant = "RyanTerm";
    hash = "sha256-FwIo1bVNkIrd9LIQUg4hSKv13dv97X7IVo3/IejVuGg=";
  };
})
