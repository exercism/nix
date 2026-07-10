let
  inherit (import <nixpkgs/lib>) mod;
in
{
  convert =
    number:
    let
      pling = if mod number 3 == 0 then "Pling" else "";
      plang = if mod number 5 == 0 then "Plang" else "";
      plong = if mod number 7 == 0 then "Plong" else "";
      res = pling + plang + plong;
    in
    if res == "" then toString number else res;
}
