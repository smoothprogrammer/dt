{
  description = "Swift Project";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell.override { inherit (pkgs.swift) stdenv; } {
            name = "swift-project";
            shellHook = ''
              git rev-parse --is-inside-work-tree >/dev/null 2>&1 || git init
              git config pull.rebase true
              ${pkgs.neo-cowsay}/bin/cowsay -f sage "Swift Project"
            '';
            LD_LIBRARY_PATH = "${pkgs.swiftPackages.Dispatch}/lib";
            buildInputs = with pkgs; [
              editorconfig-checker
              swift
              swift-format
              sourcekit-lsp
              swiftpm
            ];
          };
        }
      );
    };
}
