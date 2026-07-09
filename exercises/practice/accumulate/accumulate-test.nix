let
  lib = import <nixpkgs/lib>;
  inherit (import ./accumulate.nix) accumulate;
  reverseString =
    str:
    lib.pipe str [
      lib.stringToCharacters
      lib.reverseList
      lib.concatStrings
    ];
in
{
  "test accumulate empty" = {
    expr = accumulate [ ] (x: x * x);
    expected = [ ];
  };

  "test accumulate squares" = {
    expr = accumulate [ 1 2 3 ] (x: x * x);
    expected = [
      1
      4
      9
    ];
  };

  "test accumulate upcases" = {
    expr = accumulate [ "Hello" "world" ] lib.toUpper;
    expected = [
      "HELLO"
      "WORLD"
    ];
  };

  "test accumulate reversed strings" = {
    expr = accumulate [ "the" "quick" "brown" "fox" "etc" ] reverseString;
    expected = [
      "eht"
      "kciuq"
      "nworb"
      "xof"
      "cte"
    ];
  };

  "test accumulate recursively" = {
    expr = accumulate [ "a" "b" "c" ] (x: accumulate [ "1" "2" "3" ] (y: x + y));
    expected = [
      [
        "a1"
        "a2"
        "a3"
      ]
      [
        "b1"
        "b2"
        "b3"
      ]
      [
        "c1"
        "c2"
        "c3"
      ]
    ];
  };
}
