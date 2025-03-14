.PHONY: build test run clean

test:
	@mvn clean test
run:
	@mvn -e -q clean compile exec:java
nixpkgs/update:
	@nix flake lock --override-input nixpkgs github:NixOS/nixpkgs/$(rev)
