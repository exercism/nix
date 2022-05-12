# Tests

We use the `lib.debug.runTests` function from the Nixpkgs standard library to run the tests.
Nixpkgs should be automatically set up when you install Nix.

## Running the Tests
To run the tests, navigate to the exercise folder using `cd {exercise-folder-location}`.
Then run the following command:
```shell
nix eval --raw -f {exercise-test.nix}
```
If this command doesn't work, you can instead try:
```shell
nix-instantiate --eval {exercise-test.nix}
```

