let
  inherit (import <nixpkgs/lib>)
    stringToCharacters
    concatStrings
    imap0
    cartesianProduct
    range
    count
    pipe
    ;
  inherit (builtins) elemAt length;

  hasFlower =
    garden: i: j:
    i >= 0
    && j >= 0
    && i < length garden
    && j < length (elemAt garden 0)
    && elemAt (elemAt garden i) j == "*";

  countNeighboringFlowers =
    garden: i: j:
    let
      neighbors = cartesianProduct {
        i = range (i - 1) (i + 1);
        j = range (j - 1) (j + 1);
      };
    in
    count ({ i, j }: hasFlower garden i j) neighbors;

  transform =
    garden:
    imap0 (
      i: row:
      imap0 (
        j: col:
        if col != " " then
          col
        else
          let
            flowers = countNeighboringFlowers garden i j;
          in
          if flowers == 0 then " " else toString flowers
      ) row
    ) garden;
in
{
  annotate =
    garden:
    pipe garden [
      (map stringToCharacters)
      transform
      (map concatStrings)
    ];
}
