(_: prev: let
  flavors = [
    {
      flavor = "latte";
      hash = "sha256-V0LsRStF1vL+Tz8G6VaKiwiY/ZIsSkMc+f1WJAITYXU=";
    }
    {
      flavor = "frappe";
      hash = "sha256-YOatgYCJKuesVERHZVmF1xtzuLjyxCYstoWYqATq+NU=";
    }
    {
      flavor = "macchiato";
      hash = "sha256-CeSJvhjzHVTtlqgQLKOrdLXtp2OQlMh24IaA1QQiQCk=";
    }
    {
      flavor = "mocha";
      hash = "sha256-Tx2fQteL4wxhV+qHYZibakiYoEhS4HjyMO0yBcU/F6Q=";
    }
  ];
in {
  ctp-glamour = builtins.listToAttrs (builtins.map ({
      flavor,
      hash,
    }: {
      name = flavor;
      value = prev.callPackage (
        {
          stdenvNoCC,
          fetchurl,
        }:
          stdenvNoCC.mkDerivation rec {
            pname = "ctp-glamour-${flavor}";
            version = "1.0.0";

            src = fetchurl {
              url = "https://github.com/catppuccin/glamour/releases/download/v${version}/${flavor}.json";
              inherit hash;
            };

            unpackPhase = ''
              mkdir -p $out
              cp $src $out/default.json
            '';
          }
      ) {};
    })
    flavors);
})
