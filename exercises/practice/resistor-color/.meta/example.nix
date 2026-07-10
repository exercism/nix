let
  lib = import <nixpkgs/lib>;
in
rec {
  colorCode = color: lib.lists.findFirstIndex (c: c == color) null colors;
  colors = [
    "black"
    "brown"
    "red"
    "orange"
    "yellow"
    "green"
    "blue"
    "violet"
    "grey"
    "white"
  ];
}
