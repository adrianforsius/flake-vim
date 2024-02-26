{
  description = "adrianforsius neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    devenv.url = "github:cachix/devenv/latest";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tree-sitter-nu = {
      url = "github:nushell/tree-sitter-nu";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  } @ inputs: let
    defaultSystems = [
      # "aarch64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
      "x86_64-linux"
    ];

    overlays = [
      (final: prev: {
        devenv = inputs.devenv.packages.${prev.system}.devenv;
      })
    ];
  in flake-utils.lib.eachDefaultSystem (system: let
    pkgs = nixpkgs.legacyPackages.${system};
    nixvim = inputs.nixvim.legacyPackages.${system};
    nvim = nixvim.makeNixvimWithModule {
      inherit pkgs;
      # module = [(import ./config.nix )];
      module = ./config.nix;
    };
  in {
    checks = {
      default = nixpkgs.nixvimLib.check.mkTestDerivationFromNvim {
        inherit nvim;
        name = "A nixvim configuration";
      };
    };

    # apps.nvim = flake-utils.lib.mkApp {
    #   drv = packages.pwnvim;
    #   name = "pwnvim";
    #   exePath = "/bin/nvim";
    # };
    # apps.default = apps.pwnvim;
    packages.default = nvim;

    devShells = flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import inputs.nixpkgs {
        inherit system overlays;
      };
    in inputs.devenv.lib.mkShell {
      inherit inputs pkgs;
      modules = [
        (import ./devenv.nix)
      ];
    });
    # devShell.default = inputs.devenv.lib.mkShell {
    #   inherit inputs pkgs;
    #   modules = [
    #     (import ./devenv.nix)
    #   ];
    # };
  });
}
