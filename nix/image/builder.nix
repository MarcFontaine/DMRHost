{
  nixsrc
, nixpkgs ? import "${nixsrc}" {}
}:
nixpkgs.writeScriptBin "build" ''
#!/usr/bin/env bash

set -e
set -u
PS4=" $ "

set -x
exec env -i NIX_PATH="nixpkgs=${nixsrc}:nixos=${nixsrc}/nixos" nix-build \
  system.nix -A config.system.build.sdImage "$@"
''
