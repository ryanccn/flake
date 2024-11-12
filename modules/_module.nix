{
  pkgs,
  lib,
  inputs,
  inputs',
  ...
}:
{
  _module.args = {
    inputs' = lib.mapAttrs (lib.const (
      lib.mapAttrs (lib.const (value: value.${pkgs.system} or value))
    )) inputs;

    flake' = inputs'.self;
  };
}
