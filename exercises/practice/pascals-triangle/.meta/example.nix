let
  inherit (import <nixpkgs/lib>) zipListsWith;
  inherit (builtins) genList elemAt;
  nextRow = row: zipListsWith (a: b: a + b) ([ 0 ] ++ row) (row ++ [ 0 ]);
in
{
  rows =
    count:
    if count <= 0 then
      [ ]
    else
      let
        pascal = [ [ 1 ] ] ++ genList (i: nextRow (elemAt pascal i)) (count - 1);
      in
      pascal;
}
