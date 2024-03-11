(_: prev: let
  version = "2024.03.11";

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
    hash = "sha256-+ReEWd8Kpdgnq9zKA0+7KVkwwrV7tcVM9ldes2UeiG0=";
  };

  ryan-term-bin = mkFontVariant {
    variant = "RyanTerm";
    hash = "sha256-eAu26f/pJPMwV4BiABPwNJI1HRF4HbPsm/fL6/tseq4=";
  };
})
