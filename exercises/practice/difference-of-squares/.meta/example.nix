let
  inherit (import <nixpkgs/lib>) range;
  sum = builtins.foldl' (acc: n: acc + n) 0;
  square = n: n * n;
in
rec {
  squareOfSum = n: square (sum (range 1 n));
  sumOfSquares = n: sum (map square (range 1 n));
  differenceOfSquares = n: squareOfSum n - sumOfSquares n;
}
