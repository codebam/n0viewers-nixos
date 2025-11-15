{ lib
, ...
}:
{
  nixpkgs = {
    config = {
      # checkMeta = true;
      # showDerivationWarnings = [ "maintainerless" ];
      allowUnfreePredicate =
        pkg:
        builtins.elem (lib.getName pkg) [
          "steam"
          "steam-original"
          "steam-run"
          "steam-unwrapped"
          "discord"
          "discord-ptb"
          "discord-canary"
          "libretro-genesis-plus-gx"
          "libretro-snes9x"
          "libretro-fbneo"
          "libretro-mame2000"
          "libretro-mame2003"
          "libretro-mame2015"
          "vscode"
          "cuda_nvcc"
          "cuda_cudart"
        ];
    };
    overlays = [
      # TODO: research how to use overlays if you want to
      # build your own packages and install them system wide
    ];
  };
}
