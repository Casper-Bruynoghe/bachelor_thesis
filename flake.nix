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
					texliveFull # TeX Live environment
					biber # Backend for BibLaTeX
					zathura # PDF viewer
        ];

        shellHook = ''
          echo "Good luck with your bachelor's thesis!"
        '';
      };
  };
}
