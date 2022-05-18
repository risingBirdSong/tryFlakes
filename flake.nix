{
  description = "ee-try-flakes";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachSystem ["x86_64-linux"] (system: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowBroken = true;
      };
      ee-try-flakes = pkgs.callPackage ./ee-try-flakes.nix {};
    in {
      devShell = import ./shell.nix {
        inherit pkgs;
      };
      defaultPackage = ee-try-flakes;
      # packages = flake-utils.lib.flattenTree {
      #   inherit cataract;
      #   inherit docker;
      # };
    });
}
