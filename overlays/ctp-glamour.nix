(_: prev: let
  flavors = [
    {
      flavor = "latte";
      sha256 = "sha256-V0LsRStF1vL+Tz8G6VaKiwiY/ZIsSkMc+f1WJAITYXU=";
    }
    {
      flavor = "frappe";
      sha256 = "sha256-YOatgYCJKuesVERHZVmF1xtzuLjyxCYstoWYqATq+NU=";
    }
    {
      flavor = "macchiato";
      sha256 = "sha256-CeSJvhjzHVTtlqgQLKOrdLXtp2OQlMh24IaA1QQiQCk=";
    }
    {
      flavor = "mocha";
      sha256 = "sha256-Tx2fQteL4wxhV+qHYZibakiYoEhS4HjyMO0yBcU/F6Q=";
    }
  ];
in {
  ctp-glamour = builtins.listToAttrs (builtins.map ({
      flavor,
      sha256,
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
              inherit sha256;
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
