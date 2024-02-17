(_: prev: let
  version = "2024.02.16";

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
    hash = "sha256-4h9T3r/kngeGUYMj6N05QFuvg0rPICqZBKDloB/WtMc=";
  };

  ryan-term-bin = mkFontVariant {
    variant = "RyanTerm";
    hash = "sha256-NBl4Z2JT88WbgcPuei3Jcfb5n7T89oWCzOm9vBtAmkc=";
  };
})
