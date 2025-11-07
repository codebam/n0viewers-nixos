_:
{
  networking = {
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
    wireless.iwd = {
      enable = true;
    };
    nftables = {
      enable = true;
    };
    firewall = rec {
      enable = true;
      allowedTCPPorts = [ ];
      allowedUDPPorts = allowedTCPPorts;
      allowedTCPPortRanges = [ ];
      allowedUDPPortRanges = allowedTCPPortRanges;
      # this makes bridge interfaces work in libvirt
      trustedInterfaces = [ "virbr0" ];
    };
  };
}
