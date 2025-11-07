_: {
  security = {
    polkit = {
      enable = true;
    };
    pam = {
      services = {
        swaylock = { };
        systemd-run0 = { };
      };
    };
    rtkit.enable = true;
    sudo.enable = false;
  };
}
