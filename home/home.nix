{ pkgs }:

{
  home = {
    username = "n0viewers";
    homeDirectory = "/home/n0viewers";

    shell = {
      enableShellIntegration = true;
    };

    pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata Modern Classic";
      size = 24;
      x11 = {
        enable = true;
        defaultCursor = "Bibata Modern Classic";
      };
      gtk.enable = true;
    };

    shellAliases = { };

    sessionVariables = {
      EDITOR = "nano";
      NIXOS_OZONE_WL = "1";
      OBS_VKCAPTURE = "1";
      # WLR_RENDERER = "vulkan";
      MANGOHUD_CONFIGFILE = "/home/codebam/.config/MangoHud/MangoHud.conf";
      PROTON_ENABLE_WAYLAND = "1";
      PROTON_ENABLE_HDR = "1";
      PROTON_USE_NTSYNC = "1";
      SEARXNG_API_URL = "http://localhost:8081";
    };

    packages = with pkgs; [
      (discord.override {
        withOpenASAR = true;
        withVencord = true;
      })
      # Discord with Vesktop preinstalled
      heroic
      nodePackages_latest.nodejs
      pavucontrol
      playerctl
      ripgrep
      tor-browser
      (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
        virtualenv
        tkinter
        pip
        requests
      ]))
    ];

    stateVersion = "25.11";
  };
  gtk = {
    gtk2.force = true;
  };
}
