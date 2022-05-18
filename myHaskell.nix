let
  pkgs = import <nixpkgs> {};
  haskellPackages = pkgs.haskellPackages.override {
    overrides = self: super: {
      yesod = self.callHackage "yesod" "1.6.2" {};
    };
  };
in pkgs.runCommand "dummy" {
  buildInputs = [ haskellPackages.yesod ];
} ""