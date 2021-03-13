{
  imports = [
    ./configuration.nix 
    <nixpkgs/nixos/modules/installer/sd-card/sd-image-raspberrypi4.nix>
  ];

  nixpkgs.crossSystem = {
    system = "aarch64-linux";
  };
}
