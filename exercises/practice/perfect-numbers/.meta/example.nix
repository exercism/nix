let
  inherit (import <nixpkgs/lib>) range mod pipe;
  aliquotSum =
    n:
    pipe (range 2 (isqrt n)) [
      (builtins.filter (m: mod n m == 0))
      (map (m: if m * m == n then m else m + n / m))
      (builtins.foldl' builtins.add 1)
    ];
  isqrt =
    n:
    let
      go =
        x:
        let
          next = (x + n / x) / 2;
        in
        if next >= x then x else go next;
    in
    if n < 2 then n else go n;
in
{
  classify =
    n:
    if n < 1 then
      throw "Classification is only possible for positive integers."
    else if n == 1 then
      "deficient"
    else
      let
        aliquot = aliquotSum n;
      in
      if aliquot == n then
        "perfect"
      else if aliquot < n then
        "deficient"
      else
        "abundant";
}
