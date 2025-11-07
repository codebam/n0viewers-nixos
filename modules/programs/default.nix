{ pkgs, ... }:
{
  programs = {
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
