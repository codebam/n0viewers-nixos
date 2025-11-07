_:
{
  services = {
    scx = {
      enable = true;
    };
    lsfg-vk = {
      enable = true;
      ui.enable = true;
    };
    # for configuring gaming mice
    ratbagd.enable = true;
    resolved.enable = true;
    speechd.enable = true;
    udev = {
      extraRules = ''
        KERNEL=="ntsync", MODE="0660", TAG+="uaccess"
      '';
      # enable NTSync in Proton for all users
    };
    scx = {
      scheduler = "scx_lavd"; # https://github.com/sched-ext/scx/blob/main/scheds/rust/scx_lavd/README.md
      # best scheduler for gaming
    };
    desktopManager.plasma6.enable = true;
    openssh = {
      # note: this is disabled
      enable = false;
      settings = {
        PasswordAuthentication = false;
      };
      openFirewall = true;
    };
    fwupd.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    udisks2.enable = true;
    gnome.gnome-keyring.enable = true;
  };
}
