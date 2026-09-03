# SPDX-FileCopyrightText: 2026 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  pkgs,
  lib,
  inputs,
  inputs',
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./hardware-configuration.nix
    ./nix.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  # boot.loader.efi.canTouchEfiVariables = true;
  boot.tmp.cleanOnBoot = true;

  users.users.ryan = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "podman"
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    ghostty.terminfo
  ];

  networking.hostName = "umiri";
  networking.networkmanager.enable = true;
  networking.firewall = {
    allowedTCPPorts = [
      80
      443
    ];
    allowedUDPPorts = [
      80
      443
    ];
  };

  security.sudo = {
    wheelNeedsPassword = false;
    execWheelOnly = true;
  };

  virtualisation.podman = {
    enable = true;
    dockerSocket.enable = true;
    autoPrune.enable = true;
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };

  services.tailscale = {
    enable = true;
    extraUpFlags = [
      "--ssh"
      "--accept-dns=false"
    ];
  };

  services.unbound = {
    enable = true;
    settings = {
      server = {
        num-threads = 8;
      };
      forward-zone = [
        {
          name = ".";
          forward-tls-upstream = true;
          forward-addr = [
            "1.1.1.1@853#cloudflare-dns.com"
            "1.0.0.1@853#cloudflare-dns.com"
            "2606:4700:4700::1111@853#cloudflare-dns.com"
            "2606:4700:4700::1001@853#cloudflare-dns.com"
          ];
        }
      ];
    };
  };

  fonts.fontconfig.enable = false;
  xdg.autostart.enable = false;
  xdg.icons.enable = false;
  xdg.menus.enable = false;
  xdg.mime.enable = false;
  xdg.sounds.enable = false;
  time.timeZone = "UTC";

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit
        inputs
        inputs'
        ;
    };

    users.ryan = import "${inputs.self}/users/ryan-server";
  };

  system.activationScripts.dix = {
    supportsDryActivation = true;

    text = ''
      ${lib.getExe pkgs.dix} /run/current-system "$systemConfig"
    '';
  };

  system.stateVersion = "26.05"; # I read the comment
}
