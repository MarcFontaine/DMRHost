{
#  nixpkgs ? import <nixpkgs> {}
}:
let
  nixsrc = builtins.fetchTarball {
    name = "nixpkgs-src";
#    url  = "https://github.com/NixOS/nixpkgs/archive/34172ddfe9f11a9d5ba4034ebd89ecb4c1c9c188.tar.gz";
#    sha256 = "0xbz63yjq9x1jr3180ppvrryx4a0dcj3r0kzqym6n148dpj6lg78";
    url  = "https://github.com/NixOS/nixpkgs/archive/93c2261684ea8c65606d7167b5d52b8da7d7778a.tar.gz";
    sha256 = "1vjh0np1rlirbhhj9b2d0zhrqdmiji5svxh9baqq7r3680af1iif";
  };
  nixpkgs = import "${nixsrc}" {};

  dmrhost = nixpkgs.callPackage ./DMRHost.nix {};
  dmrhost_static = nixpkgs.pkgsStatic.callPackage ./DMRHost.nix {};
  dmrhost_rpi = nixpkgs.pkgsCross.raspberryPi.callPackage ./DMRHost.nix {};
  dmrhost_rpi_static = nixpkgs.pkgsCross.muslpi.callPackage ./DMRHost.nix {static=true;};
  dmrhost_rpi4_static = nixpkgs.pkgsCross.aarch64-multiplatform-musl.callPackage ./DMRHost.nix {static=true;};

  #  images = import ./image/default.nix {inherit nixsrc;};
  builder = import ./image/builder.nix {inherit nixsrc;};
in
{
inherit dmrhost;
inherit dmrhost_static;
inherit dmrhost_rpi;
inherit dmrhost_rpi_static;
inherit dmrhost_rpi4_static;
inherit builder;
}
