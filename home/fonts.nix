{ pkgs, flake', ... }:
{
  home.packages = with pkgs; [
    inter
    public-sans

    (flake'.packages.ibm-plex-compat.override {
      families = [
        "sans"
        "serif"
        "mono"
      ];
    })

    flake'.packages.ryan-mono-bin

    # Install variable fonts for Cascadia Code instead of static fonts
    (cascadia-code.overrideAttrs {
      installPhase = ''
        runHook preInstall
        install -Dm644 ttf/*.ttf -t $out/share/fonts/truetype
        runHook postInstall
      '';
    })

    nerd-fonts.symbols-only
  ];
}
