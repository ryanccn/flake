{pkgs, ...}: let
  # inherit (pkgs) lib;
  toml = pkgs.formats.toml {};
in {
  home.file.".cargo/config.toml".source = toml.generate "config.toml" {
    # build.rustc-wrapper = lib.getExe' pkgs.sccache "sccache";
  };
}
