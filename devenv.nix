{pkgs, ...}:
with pkgs; {
  packages = [
    alejandra
    shellcheck
    shfmt
  ];

  enterShell = ''
    echo "devenv:"
    alejandra --version
  '';

  pre-commit = {
    hooks = {
      alejandra.enable = true;
      shfmt.enable = false;

      deadnix.enable = true;
      deadnix.settings = {
        edit = true;
        noLambdaArg = true;
      };
    };
  };
}
