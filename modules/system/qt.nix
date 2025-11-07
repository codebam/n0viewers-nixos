{ lib, ... }:
{
  qt.platformTheme = lib.mkForce "kde";
  # resolves some stylix issues with applying themes to kde which is unsupported
}
