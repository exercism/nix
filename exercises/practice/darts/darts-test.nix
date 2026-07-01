let
  inherit (import ./darts.nix) score;
in
{
  "test missed target" = {
    expr = score (-9.0) 9.0;
    expected = 0;
  };

  "test on the outer circle" = {
    expr = score 0.0 10.0;
    expected = 1;
  };

  "test on the middle circle" = {
    expr = score (-5.0) 0.0;
    expected = 5;
  };

  "test on the inner circle" = {
    expr = score 0.0 (-1.0);
    expected = 10;
  };

  "test exactly on center" = {
    expr = score 0.0 0.0;
    expected = 10;
  };

  "test near the center" = {
    expr = score (-0.1) (-0.1);
    expected = 10;
  };

  "test just within the inner circle" = {
    expr = score 0.7 0.7;
    expected = 10;
  };

  "test just outside the inner circle" = {
    expr = score 0.8 (-0.8);
    expected = 5;
  };

  "test just within the middle circle" = {
    expr = score (-3.5) 3.5;
    expected = 5;
  };

  "test just outside the middle circle" = {
    expr = score (-3.6) (-3.6);
    expected = 1;
  };

  "test just within the outer circle" = {
    expr = score (-7.0) 7.0;
    expected = 1;
  };

  "test just outside the outer circle" = {
    expr = score 7.1 (-7.1);
    expected = 0;
  };

  "test asymmetric position between the inner and middle circles" = {
    expr = score 0.5 (-4.0);
    expected = 5;
  };
}
