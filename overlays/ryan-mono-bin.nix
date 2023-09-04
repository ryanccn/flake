(_: prev: let
  version = "2023.09.04";

  mkFontVariant = {
    variant,
    sha256,
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

        inherit sha256;

        meta = with lib; {
          homepage = "https://github.com/ryanccn/ryan-mono";
          description = "Iosevka with customizations and Nerd Font patches";
          platforms = platforms.all;
        };
      }) {};
in {
  ryan-mono-bin = mkFontVariant {
    variant = "ryan-mono";
    sha256 = "sha256-q3VU2RvkIi67s048D03yxwGCDxW80JPRJCf6jy5pnNc=";
  };

  ryan-term-bin = mkFontVariant {
    variant = "ryan-term";
    sha256 = "sha256-i9+xDfpEHPjLANarS3zFiACuTmw6P1h45EYgudy5QZE=";
  };
})
