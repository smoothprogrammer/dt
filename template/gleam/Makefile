nixpkgs/update:
	@nix flake lock --override-input nixpkgs github:NixOS/nixpkgs/$(rev)

.PHONY: build test run clean

build:
	@gleam build
run:
	@gleam run
clean:
	@gleam clean
