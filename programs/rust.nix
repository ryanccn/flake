{pkgs, ...}: let
  inherit (pkgs) lib;
in {
  home.file.".cargo/config.toml".text = ''
    [build]
    rustc-wrapper = "${lib.getExe' pkgs.sccache "sccache"}"
  '';
}
