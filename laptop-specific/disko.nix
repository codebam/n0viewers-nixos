{
  disko.devices = {
    disk = {
      nixos = {
        # TODO: put your disk id here
        device = "/dev/disk/by-id/nvme-Micron_2500_MTFDKBK1T0QGN_25024D7C572C";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            esp = {
              type = "EF00";
              size = "500M";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            swap = {
              # TODO: adjust as needed
              size = "8G";
              content = {
                type = "swap";
              };
            };
            root = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                subvolumes = {
                  "/@root" = {
                    mountOptions = [ "compress=zstd" ];
                    mountpoint = "/";
                  };
                  "/@nix" = {
                    mountOptions = [ "compress=zstd" ];
                    mountpoint = "/nix";
                  };
                  "/@swap" = {
                    mountpoint = "/swap";
                    swap = {
                      swapfile.size = "8G";
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
