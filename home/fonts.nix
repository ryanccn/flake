{pkgs, ...}: {
  home.packages = with pkgs; [
    inter
    public-sans
    ibm-plex

    monaspace
    ryan-mono-bin
    ryan-term-bin
    commit-mono
    (nerdfonts.override {
      fonts = [
        "CascadiaCode"
        "NerdFontsSymbolsOnly"
      ];
    })
  ];
}
