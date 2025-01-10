# dt

Dev Tools.

## Template

Provide a template to setup a project in a specified programming language.

```sh
nix flake init -t github:minizilla/dt#{programming-language}
```

## Bin

Provide a binary to work with a specified programming language.
This is useful when working with a non-Nix Flake project.

```sh
nix flake init -t github:minizilla/dt#bin-{programming-language}
```
