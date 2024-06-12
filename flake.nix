{
  description = "adrianforsius neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    devenv.url = "github:cachix/devenv/latest";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  } @ inputs: let
    overlays = [
      (final: prev: {
        devenv = inputs.devenv.packages.${prev.system}.devenv;
      })
    ];
  in
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      nixvim = inputs.nixvim.legacyPackages.${system};
      nixvimLib = inputs.nixvim.lib.${system};
      nvim = nixvim.makeNixvimWithModule {
        inherit pkgs;
        module = ./config;
      };
      # TODO: build nixvim with runtime dependencies
      # app = pkgs.writeShellApplication {
      #   name = "adrianforsiusneovim";
      #   runtimeInputs = pkgs.gomodifytags;
      #   text = ''
      #     exec ${nvim}/bin/nvim $@"
      #   '';
      # };
    in {
      checks = {
        default = nixvimLib.check.mkTestDerivationFromNvim {
          inherit nvim;
          name = "A nixvim configuration";
        };
      };

      packages.default = nvim;
      packages.full = nvim;

      devShells.default = let
        pkgs = import inputs.nixpkgs {
          inherit system overlays;
        };
      in
        inputs.devenv.lib.mkShell {
          inherit inputs pkgs;
          modules = [
            (import ./devenv.nix)
          ];
        };
    });
}
