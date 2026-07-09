let
  inherit (import ./difference-of-squares.nix) squareOfSum sumOfSquares differenceOfSquares;
in
{
  "test square of sum 1" = {
    expr = squareOfSum 1;
    expected = 1;
  };

  "test square of sum 5" = {
    expr = squareOfSum 5;
    expected = 225;
  };

  "test square of sum 100" = {
    expr = squareOfSum 100;
    expected = 25502500;
  };

  "test sum of squares 1" = {
    expr = sumOfSquares 1;
    expected = 1;
  };

  "test sum of squares 5" = {
    expr = sumOfSquares 5;
    expected = 55;
  };

  "test sum of squares 100" = {
    expr = sumOfSquares 100;
    expected = 338350;
  };

  "test difference of squares 1" = {
    expr = differenceOfSquares 1;
    expected = 0;
  };

  "test difference of squares 5" = {
    expr = differenceOfSquares 5;
    expected = 170;
  };

  "test difference of squares 100" = {
    expr = differenceOfSquares 100;
    expected = 25164150;
  };
}
