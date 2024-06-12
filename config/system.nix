{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gomodifytags
  ];
}
