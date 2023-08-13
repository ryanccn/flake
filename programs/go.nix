{
  lib,
  stdenv,
  ...
}: let
  inherit (stdenv) isDarwin;
in {
  programs.go = {
    enable = true;
    goPath = ".go";
  };

  home.file."Library/Application Support/go/env".text = lib.optionalString isDarwin ''
    GOTOOLCHAIN=path
    GOPROXY=direct
  '';
}
