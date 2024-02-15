(_: prev: let
  version = "2024.02.15";

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
          stripRoot = false;
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
    hash = "sha256-9ojd6qCMf+lGa//5ZmY/ob6sbJvkBLqWTjyz7I5Yr4M=";
  };

  ryan-term-bin = mkFontVariant {
    variant = "RyanTerm";
    hash = "sha256-23+qURL4jBzsnyglPrYYF2pBTkp/WpzR9GQ2nbuJC4E=";
  };
})
