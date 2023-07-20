{
  lib,
  stdenv,
  rustPlatform,
  fetchCrate,
  darwin,
  libiconv,
  pkg-config,
}:
rustPlatform.buildRustPackage rec {
  pname = "gen-license";
  version = "0.1.2";

  src = fetchCrate {
    inherit pname version;
    sha256 = "sha256-YZcycLQ436cjr2YTT7TEyMdeLTOl9oEfa5x3lgnnYyo=";
  };

  cargoLock.lockFile = "${src}/Cargo.lock";

  buildInputs =
    []
    ++ lib.optionals stdenv.isDarwin [
      darwin.apple_sdk_11_0.frameworks.CoreFoundation
      darwin.apple_sdk_11_0.frameworks.Security
      darwin.IOKit
      libiconv
    ];

  nativeBuildInputs = [pkg-config];
}
