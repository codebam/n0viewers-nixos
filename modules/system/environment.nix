{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      dig
      git
      gparted
      libnotify
      mangohud
      nh
      rclone
      run0-sudo-shim
      wl-clipboard
      xdg-utils
      # System monitoring and debugging tools
      htop
      btop
      iotop
      strace
      lsof
      # Archive and compression tools
      unzip
      zip
      _7zz
      (wrapRetroArch {
        cores = with libretro; [
          genesis-plus-gx # Sega
          snes9x # SNES
          beetle-psx-hw # PlayStation
          dolphin # GameCube / Wii
          stella # Atari 2600
          # mame # MAME
          # mame2000 # MAME
          # mame2003 # MAME
          # mame2015 # MAME
          # mame2016 # MAME
          # neocd # Neo ?
          fbneo # various
          mupen64plus # Nintendo 64
          nestopia # Nintendo NES
          mgba # Game Boy Advance
          # fuse # ZX Spectrum
          melonds # Nintendo DS
          desmume # Nintendo DS
          desmume2015 # Nintendo DS
          ppsspp # PlayStation Portable
          citra # Nintendo 3DS
        ];
      })
    ];
  };
}
