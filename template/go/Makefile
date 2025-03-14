.PHONY: build test run clean

test:
	@go test -cover ./...
run:
	@go run main.go
nixpkgs/update:
	@nix flake lock --override-input nixpkgs github:NixOS/nixpkgs/$(rev)
