let
  inherit (import <nixpkgs/lib>) toBaseDigits;
  isValid = digits: base: builtins.all (digit: digit >= 0 && digit < base) digits;
  digitsToInt = base: builtins.foldl' (acc: digit: acc * base + digit) 0;
in
{
  rebase =
    inputBase: digits: outputBase:
    if inputBase < 2 then
      throw "input base must be >= 2"
    else if !isValid digits inputBase then
      throw "all digits must satisfy 0 <= d < input base"
    else if outputBase < 2 then
      throw "output base must be >= 2"
    else
      toBaseDigits outputBase (digitsToInt inputBase digits);
}
