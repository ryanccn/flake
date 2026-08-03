# SPDX-FileCopyrightText: 2025 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{ inputs, pkgs, ... }:
let
  rust-bin = inputs.rust-overlay.lib.mkRustBin { } pkgs;
in
{
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
  ];
}
