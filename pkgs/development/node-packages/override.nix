{ pkgs ? import <nixpkgs> { } , system ? builtins.currentSystem,
}:
let
  nodePackages = import ./default.nix {
    inherit pkgs system;
  };
in
nodePackages // {
 puppeteer = nodePackages.puppeteer.override {
    buildPhase = ''
      export PUPPETEER_SKIP_DOWNLOAD=true
    '';
  };
}
