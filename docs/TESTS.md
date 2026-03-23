# Tests

We use the `lib.debug.runTests` function from the Nixpkgs standard library to run the tests.

## Running the Tests

Navigate to the exercise folder and run:

```shell
nix eval --raw --impure -f {exercise}-test.nix
```

Or alternatively:

```shell
nix-instantiate --eval --strict {exercise}-test.nix
```

## If You See "cannot look up nixpkgs in pure evaluation mode"

The test files import `<nixpkgs/lib>`, which requires nixpkgs to be on your `NIX_PATH`.
This is set up automatically on NixOS, but may not be on other systems.

If you get this error, pass nixpkgs explicitly:

```shell
nix eval --raw --impure \
  -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz \
  -f {exercise}-test.nix
```

Or add nixpkgs to your channels permanently:

```shell
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update
```

After that, the standard `nix eval --raw --impure -f {exercise}-test.nix` command will work.
