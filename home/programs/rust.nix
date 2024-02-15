{
  pkgs,
  lib,
  config,
  ...
}: let
  toml = pkgs.formats.toml {};
in {
  home.file."${config.xdg.dataHome}/cargo/config.toml".source = toml.generate "config.toml" {
    build.rustc-wrapper = "${lib.getExe' pkgs.sccache "sccache"}";
  };

  home.packages = with pkgs; [
    (fenix.combine (
      with fenix;
      with stable; [
        cargo
        rustc
        rustfmt
        clippy
        rust-src
        targets.wasm32-unknown-unknown.stable.rust-std
      ]
    ))

    cargo-bloat
    cargo-cache
    cargo-deny
    cargo-expand
    cargo-watch
  ];
}
