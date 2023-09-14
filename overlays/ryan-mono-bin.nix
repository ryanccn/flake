(_: prev: let
  version = "2023.09.14";

  mkFontVariant = {
    variant,
    hash,
  }:
    prev.callPackage ({
      lib,
      fetchzip,
    }:
      fetchzip rec {
        pname = variant;
        inherit version;

        url = "https://github.com/ryanccn/ryan-mono/releases/download/${version}/${variant}.zip";
        stripRoot = false;

        postFetch = ''
          postDir="$TMPDIR/post"
          mkdir -p $postDir
          mv $out/* $postDir
          mkdir -p $out/share/fonts/truetype
          mv $postDir/*.ttf $out/share/fonts/truetype
        '';

        inherit hash;

        meta = with lib; {
          homepage = "https://github.com/ryanccn/ryan-mono";
          description = "Iosevka with customizations and Nerd Font patches";
          platforms = platforms.all;
        };
      }) {};
in {
  ryan-mono-bin = mkFontVariant {
    variant = "ryan-mono";
    hash = "sha256-T5S9tfJZz/5YDXKTir+NHHxwyJZt+z1fkgzpT7sJyEU=";
  };

  ryan-term-bin = mkFontVariant {
    variant = "ryan-term";
    hash = "sha256-RY7l/RG35fE0AkOHSSwbw3vi2ru++J5Wo/43hmNAySg=";
  };
})
