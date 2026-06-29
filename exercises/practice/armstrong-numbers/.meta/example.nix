let
  inherit (import <nixpkgs/lib>) toBaseDigits range;
  pow = base: exp: builtins.foldl' (acc: _: acc * base) 1 (range 1 exp);
in
{
  isArmstrongNumber =
    n:
    let
      digits = toBaseDigits 10 n;
      len = builtins.length digits;
      armstrong = builtins.foldl' (acc: digit: acc + pow digit len) 0 digits;
    in
    armstrong == n;
}
