{
  description = "FOSS Club CIT Website";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
     	let
    		pkgs = nixpkgs.legacyPackages.${system};
     	in {
        devShells.default = pkgs.mkShell {
       	  packages = with pkgs; [
            nodejs_22
            bun
         	];
          shellHook = ''
            export NIX_SHELL_NAME="fcc-web";
          '';
        };
      }
    );
}
