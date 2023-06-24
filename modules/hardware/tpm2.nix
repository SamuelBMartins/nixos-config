{ config, pkgs, ... }: 
let
  tpm2-update = pkgs.writeShellScriptBin "tpm2-update" ''
    sudo systemd-cryptenroll --wipe-slot=tpm2 ${config.boot.initrd.luks.devices."nixos".device}; 
    sudo systemd-cryptenroll --tpm2-pcrs=0+2+4 ${config.boot.initrd.luks.devices."nixos".device}
  '';
in
{
  environment.systemPackages = with pkgs; [
    tpm2-tss
    tpm2-update
  ];
  
}
