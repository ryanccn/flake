(_: prev: let
  version = "2023.09.28";

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
    hash = "sha256-uDr7A1gEEazQWcqpH4YTNKycX6buE8QerECCrHXVbD8=";
  };

  ryan-term-bin = mkFontVariant {
    variant = "ryan-term";
    hash = "sha256-91pS9CzbYKywOIrUwWJpXnl5lJKZVH4nSadCh8PQscU=";
  };
})
