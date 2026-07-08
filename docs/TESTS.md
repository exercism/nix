# Tests

We use the `nix-unit` package to run the tests.

## Running the Tests

Navigate to the exercise folder and run:

```shell
nix-unit {exercise}-test.nix
```

## If You See "cannot look up nixpkgs in pure evaluation mode"

The test files import `<nixpkgs/lib>`, which requires nixpkgs to be on your `NIX_PATH`.
This is set up automatically on NixOS, but may not be on other systems.
If you get this error, add nixpkgs to your channels:

```shell
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update
```
