{ pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
      protontricks = {
        enable = true;
      };
    };
    gamescope = {
      enable = true;
    };
    gamemode = {
      enable = true;
    };
    fish = {
      enable = true;
    };
    nix-ld.enable = true;
    wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };
    kdeconnect.enable = true;
    dconf.enable = true;
  };
}
