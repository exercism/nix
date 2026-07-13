let
  inherit (import ./square-root.nix) squareRoot;
in
{
  "test root of 1" = {
    expr = squareRoot 1;
    expected = 1;
  };

  "test root of 4" = {
    expr = squareRoot 4;
    expected = 2;
  };

  "test root of 25" = {
    expr = squareRoot 25;
    expected = 5;
  };

  "test root of 81" = {
    expr = squareRoot 81;
    expected = 9;
  };

  "test root of 196" = {
    expr = squareRoot 196;
    expected = 14;
  };

  "test root of 65025" = {
    expr = squareRoot 65025;
    expected = 255;
  };
}
