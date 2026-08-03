# SPDX-FileCopyrightText: 2026 Ryan Cao <hello@ryanccn.dev>
#
# SPDX-License-Identifier: Apache-2.0

{
  pkgs,
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
  boot.loader.efi.canTouchEfiVariables = true;

  users.users.ryan = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "docker"
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    helix
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

  security.sudo.wheelNeedsPassword = false;

  programs.fish.enable = true;
  programs.starship.enable = true;

  virtualisation.docker.enable = true;

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };
  services.tailscale = {
    enable = true;
  };

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

  system.stateVersion = "26.05"; # I read the comment
}
