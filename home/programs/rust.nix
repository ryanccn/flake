{
  pkgs,
  inputs,
  lib,
  config,
  ...
}:
let
  toml = pkgs.formats.toml { };
  rust-bin = inputs.rust-overlay.lib.mkRustBin { } pkgs;
in
{
  home.file."${config.xdg.dataHome}/cargo/config.toml".source = toml.generate "config.toml" {
    linker = "${lib.getExe pkgs.clang}";
    rustflags = [
      "-C"
      "link-arg=-fuse-ld=${lib.getExe pkgs.mold}"
    ];
  };

  home.packages = with pkgs; [
    (rust-bin.stable.latest.default.override {
      extensions = [
        "rust-src"
        "rust-analyzer"
        "llvm-tools-preview"
      ];
    })

    cargo-audit
    cargo-bloat
    cargo-cache
    cargo-deny
    cargo-expand
    cargo-watch
  ];
}
