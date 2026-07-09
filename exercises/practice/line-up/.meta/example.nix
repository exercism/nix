let
  inherit (import <nixpkgs/lib>) mod;
  suffix =
    number:
    let
      units = mod number 10;
      tens = mod (number / 10) 10;
    in
    if tens == 1 then
      "th"
    else if units == 1 then
      "st"
    else if units == 2 then
      "nd"
    else if units == 3 then
      "rd"
    else
      "th";
in
{
  format =
    name: number:
    "${name}, you are the ${toString number}${suffix number} customer we serve today. Thank you!";
}
