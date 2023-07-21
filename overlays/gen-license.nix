(_: prev: {
  gen-license = prev.rustPlatform.buildRustPackage rec {
    pname = "gen-license";
    version = "0.1.2";

    src = prev.fetchCrate {
      inherit pname version;
      sha256 = "sha256-YZcycLQ436cjr2YTT7TEyMdeLTOl9oEfa5x3lgnnYyo=";
    };

    cargoLock.lockFile = "${src}/Cargo.lock";

    buildInputs =
      []
      ++ prev.lib.optionals prev.stdenv.isDarwin [
        prev.darwin.apple_sdk_11_0.frameworks.CoreFoundation
        prev.darwin.apple_sdk_11_0.frameworks.Security
        prev.darwin.IOKit
        prev.libiconv
      ];

    nativeBuildInputs = [prev.pkg-config];
  };
})
