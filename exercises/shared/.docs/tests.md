## Running the Tests

To run the tests for this exercise, use:

```bash
nix eval --raw -f <slug>-test.nix
```

Or alternatively:

```bash
nix-instantiate --eval <slug>-test.nix
```

You will need [Nix](https://nixos.org/download/) installed and nixpkgs available on your `NIX_PATH`.

If nixpkgs is not on your `NIX_PATH`, pass it explicitly:

```bash
nix eval --raw -f <slug>-test.nix -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz
```
