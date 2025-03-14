.PHONY: build test run clean

run:
	@elm reactor
nixpkgs/update:
	@nix flake lock --override-input nixpkgs github:NixOS/nixpkgs/$(rev)
