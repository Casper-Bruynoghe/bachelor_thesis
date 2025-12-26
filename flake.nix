{
  description = "Dev invornment for my bachelor's thesis";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    system = "x86_64-linux";
  in {
    devShells."${system}".default = let
      pkgs = import nixpkgs {inherit system;};
    in
      pkgs.mkShell {
        packages = with pkgs; [
					miktex # Modern TeX distribution
					biber # Backend for BibLaTeX
        ];

        shellHook = ''
          echo "Good luck with your bachelor's thesis!"
        '';
      };
  };
}
