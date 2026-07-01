with builtins;
let
  inherit (import <nixpkgs/lib>) range mod;
  sum = foldl' add 0;
in
{
  sumOfMultiples =
    factors: limit:
    let
      nonZeroFactors = filter (n: n != 0) factors;
      isMultiple = number: any (factor: mod number factor == 0) nonZeroFactors;
    in
    sum (filter isMultiple (range 1 (limit - 1)));
}
