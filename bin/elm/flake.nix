{
  description = "Elm Binary";

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
            name = "elm-binary";
            buildInputs = with pkgs; [
              elmPackages.elm
              elmPackages.elm-language-server
              elmPackages.elm-test
              elmPackages.elm-format
            ];
          };
        }
      );
    };
}
