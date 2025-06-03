{
  description = "Dev Tools";

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
          default = pkgs.mkShell {
            name = "dt";
            shellHook = ''
              git config pull.rebase true
              ${pkgs.neo-cowsay}/bin/cowsay -f sage "Dev Tools"
            '';
            buildInputs = with pkgs; [
              editorconfig-checker
            ];
          };
        }
      );

      templates = {
        c = {
          path = ./template/c;
          description = "Setup C Project";
        };
        elm = {
          path = ./template/elm;
          description = "Setup Elm Project";
        };
        gleam = {
          path = ./template/gleam;
          description = "Setup Gleam Project";
        };
        gleam-fullstack = {
          path = ./template/gleam-fullstack;
          description = "Setup Gleam Fullstack Project";
        };
        go = {
          path = ./template/go;
          description = "Setup Go Project";
        };
        guile = {
          path = ./template/guile;
          description = "Setup Guile Project";
        };
        java = {
          path = ./template/java;
          description = "Setup Java Project";
        };
        lua = {
          path = ./template/lua;
          description = "Setup Lua Project";
        };
        zig = {
          path = ./template/zig;
          description = "Setup Zig Project";
        };

        bin-elm = {
          path = ./bin/elm;
          description = "Install Elm Binary";
        };
        bin-gleam = {
          path = ./bin/gleam;
          description = "Install Gleam Binary";
        };
        bin-go = {
          path = ./bin/go;
          description = "Install Go Binary";
        };
        bin-java = {
          path = ./bin/java;
          description = "Install Java Binary";
        };
        bin-zig = {
          path = ./bin/zig;
          description = "Install Zig Binary";
        };
      };
    };
}
