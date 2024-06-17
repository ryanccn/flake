{ pkgs, ... }:
{
  home.packages = with pkgs; [
    inter
    public-sans
    ibm-plex

    ryan-mono-bin

    # Install the variable fonts for Cascadia Code (which
    # are recommended) instead of the static fonts
    (cascadia-code.overrideAttrs {
      installPhase = ''
        runHook preInstall
        install -Dm644 ttf/*.ttf -t $out/share/fonts/truetype
        runHook postInstall
      '';
    })

    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}
