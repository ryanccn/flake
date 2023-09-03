{pkgs, ...}: {
  home.packages = with pkgs; [
    inter
    public-sans
    inriafonts
    ibm-plex
    monocraft
    ryan-mono-bin
    ryan-term-bin
    (nerdfonts.override {fonts = ["CascadiaCode"];})
  ];
}
