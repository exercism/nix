let
  inherit (import <nixpkgs/lib>) replicate last max;
  inherit (builtins) foldl' genList elemAt;
in
{
  maximumValue =
    capacity: items:
    let
      initial = replicate (capacity + 1) 0;
      step =
        prev:
        { weight, value }:
        genList (
          i:
          let
            prevBest = elemAt prev i;
          in
          if i < weight then prevBest else max prevBest (elemAt prev (i - weight) + value)
        ) (capacity + 1);
    in
    last (foldl' step initial items);
}
