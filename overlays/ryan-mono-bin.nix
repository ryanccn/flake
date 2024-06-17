_: prev:
let
  version = "2024.05.26";

  mkFontVariant =
    { variant, hash }:
    prev.callPackage (
      {
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

        installPhase = ''
          runHook preInstall
          install -Dm644 *.ttf -t $out/share/fonts/truetype
          runHook postInstall
        '';

        meta = with lib; {
          homepage = "https://github.com/ryanccn/ryan-mono";
          platforms = platforms.all;
          license = licenses.ofl;
        };
      }
    ) { };
in
{
  ryan-mono-bin = prev.symlinkJoin {
    name = "ryan-mono-bin-${version}";

    paths = [
      (mkFontVariant {
        variant = "RyanMono";
        hash = "sha256-smlvBfpwVoD0qfmmHcJjsLdiblXjy5eevZfK4qDc9x8=";
      })

      (mkFontVariant {
        variant = "RyanTerm";
        hash = "sha256-12xaJqgR5R6SZnZ7vJeD5zg2TZbWEiUrdyK+ljekMvc=";
      })

      (mkFontVariant {
        variant = "RyanMonoNerdFont";
        hash = "sha256-n2d9K1rJuWCF2NgkRLQQCNCAxYfiBVv/jpn+BzqBvAI=";
      })

      (mkFontVariant {
        variant = "RyanTermNerdFont";
        hash = "sha256-yrzgNRD560FhHLSK1neHVSnB+ZiHP2bmKzD1pGTu9Ro=";
      })
    ];
  };
}
