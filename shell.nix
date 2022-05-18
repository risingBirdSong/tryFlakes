{
  pkgs ? import <nixpkgs> {} ,
  ...
}:
pkgs.mkShell {
  inputsFrom = [
    (import ./ee-try-flakes.nix pkgs).env
  ];
  buildInputs = with pkgs; [
    haskell-language-server
    haskellPackages.cabal-install
    haskellPackages.ghcid
    haskellPackages.hlint
    haskellPackages.hpack
    haskellPackages.fourmolu
    niv
  ];
  withHoogle = true;
  # required for 'make test' hedgehog output
  LANG = "en_US.utf8";
}
