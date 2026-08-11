let
  inherit (import <nixpkgs/lib>) mod;

  numbers = {
    "0" = "zero";
    "1" = "one";
    "2" = "two";
    "3" = "three";
    "4" = "four";
    "5" = "five";
    "6" = "six";
    "7" = "seven";
    "8" = "eight";
    "9" = "nine";
    "10" = "ten";
    "11" = "eleven";
    "12" = "twelve";
    "13" = "thirteen";
    "14" = "fourteen";
    "15" = "fifteen";
    "16" = "sixteen";
    "17" = "seventeen";
    "18" = "eighteen";
    "19" = "nineteen";
    "20" = "twenty";
    "30" = "thirty";
    "40" = "forty";
    "50" = "fifty";
    "60" = "sixty";
    "70" = "seventy";
    "80" = "eighty";
    "90" = "ninety";
  };

  go =
    n:
    numbers.${toString n} or (
      if n <= 99 then
        "${go (10 * (n / 10))}-${go (mod n 10)}"
      else if n <= 999 then
        let
          rem = mod n 100;
        in
        "${go (n / 100)} hundred" + (if rem == 0 then "" else " ${go rem}")
      else if n <= 999999 then
        let
          rem = mod n 1000;
        in
        "${go (n / 1000)} thousand" + (if rem == 0 then "" else " ${go rem}")
      else if n <= 999999999 then
        let
          rem = mod n 1000000;
        in
        "${go (n / 1000000)} million" + (if rem == 0 then "" else " ${go rem}")
      else
        let
          rem = mod n 1000000000;
        in
        "${go (n / 1000000000)} billion" + (if rem == 0 then "" else " ${go rem}")
    );
in
{
  say = n: if n < 0 || n >= 1000000000000 then throw "input out of range" else go n;
}
