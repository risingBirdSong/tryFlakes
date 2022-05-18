{pkgs, ...}: let
  myHaskell = pkgs.callPackage ./myHaskell.nix {};
in
  myHaskell.callCabal2nix "ee-try-flakes" ./. {}
