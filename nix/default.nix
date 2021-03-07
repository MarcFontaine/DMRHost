{
  nixpkgs ? import <nixpkgs> {}
}:
let
  dmrhost = nixpkgs.callPackage ./DMRHost.nix {};
  dmrhost_static = nixpkgs.pkgsStatic.callPackage ./DMRHost.nix {};
  dmrhost_rpi = nixpkgs.pkgsCross.raspberryPi.callPackage ./DMRHost.nix {};
  dmrhost_rpi_static = nixpkgs.pkgsCross.muslpi.callPackage ./DMRHost.nix {static=true;};
  dmrhost_rpi4_static = nixpkgs.pkgsCross.aarch64-multiplatform-musl.callPackage ./DMRHost.nix {static=true;};
in
{
  inherit dmrhost;
  inherit dmrhost_static;
  inherit dmrhost_rpi;
  inherit dmrhost_rpi_static;  
  inherit dmrhost_rpi4_static;  
}
