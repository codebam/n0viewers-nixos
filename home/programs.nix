{
  lib,
  ...
}:

{
  programs = {
    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };
    brave = {
      enable = true;
    };
    yt-dlp = {
      enable = true;
    };
    mpv = {
      enable = true;
      config = {
        save-position-on-quit = true;
        resume-playback = true;
      };
    };
    mangohud = {
      enable = true;
    }; # MANGOHUD=1 %command%
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting ""
        set -gx EDITOR nano
        set -gx NIXOS_OZONE_WL 1
      '';
    };
    bash = {
      enable = true;
    };
    git = {
      enable = true;
    };
    foot = {
      enable = true;
      settings = {
        main = {
          term = "xterm-256color";
        };
        mouse = {
          hide-when-typing = "yes";
        };
        colors.alpha = lib.mkForce 0.75;
      };
    };
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
    fzf = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      defaultOptions = [
        "--height 40%"
        "--layout=reverse"
        "--border"
        "--inline-info"
      ];
      tmux = {
        enableShellIntegration = true;
      };
    };
    starship = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
    };
  };
}
