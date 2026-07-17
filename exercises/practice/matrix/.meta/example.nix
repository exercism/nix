let
  inherit (import <nixpkgs/lib>) splitString toInt pipe;
  inherit (builtins) elemAt genList length;
  toMatrix =
    string:
    pipe string [
      (splitString "\n")
      (map (splitString " "))
      (map (map toInt))
    ];
in
{
  row = string: index: elemAt (toMatrix string) (index - 1);
  column =
    string: index:
    let
      matrix = toMatrix string;
    in
    genList (i: elemAt (elemAt matrix i) (index - 1)) (length matrix);
}
