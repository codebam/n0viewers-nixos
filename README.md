# To install:

Download a nixos minimal iso.

```
git clone https://github.com/codebam/n0viewers-nixos /tmp/n0viewers-nixos
```

1. go into the directory
1. run `grep -r TODO` and update the files that need updating
1. edit `laptop-specific/disko.nix` for how you want to partition
1. run the below command to format and mount your disks

```shell
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount /tmp/n0viewers-nixos/laptop-specific/disko.nix
```

1. install nixos as normal

```shell
nixos-install --flake /tmp/n0viewers-nixos#n0viewers-nixos
```
