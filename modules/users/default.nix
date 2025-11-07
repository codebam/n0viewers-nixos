{ pkgs, ... }:
{
  users = {
    mutableUsers = false;
    users = {
      n0viewers = {
        isNormalUser = true;
        home = "/home/n0viewers";
        extraGroups = [
          "wheel"
          "networkmanager"
          "libvirtd"
          "video"
          "uinput"
          "wireshark"
          "pipewire"
        ];
        # TODO: hash your password using:
        # mkpasswd -m sha-512
        # and then put the result here
        # below is "password" as a hashedPassword
        hashedPassword = "$6$7b4vd2/rikqEAKFC$nPx5haSUsaCdIuZvxRAsfDxzE710EnmujVnyvvLw.2.GSavH0xUHrL0BCBSJwY/flhIQgy2POnOcj02CTtwGn.";
        packages = [ ];
        shell = pkgs.fish;
        linger = true;
        openssh.authorizedKeys.keys = [
          # you can put openssh keys here for ssh
        ];
      };
    };
  };
}
