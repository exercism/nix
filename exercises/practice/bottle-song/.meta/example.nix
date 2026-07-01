let
  inherit (import <nixpkgs/lib>) toLower concatStringsSep;
  quantifiers = [
    "no"
    "One"
    "Two"
    "Three"
    "Four"
    "Five"
    "Six"
    "Seven"
    "Eight"
    "Nine"
    "Ten"
  ];

  verse =
    n:
    let
      before = builtins.elemAt quantifiers n;
      after = toLower (builtins.elemAt quantifiers (n - 1));
      bottlesBefore = if n == 1 then "bottle" else "bottles";
      bottlesAfter = if n == 2 then "bottle" else "bottles";
    in
    ''
      ${before} green ${bottlesBefore} hanging on the wall,
      ${before} green ${bottlesBefore} hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be ${after} green ${bottlesAfter} hanging on the wall.
    '';
in
{
  recite =
    bottles: takeDown: concatStringsSep "\n" (builtins.genList (i: verse (bottles - i)) takeDown);
}
