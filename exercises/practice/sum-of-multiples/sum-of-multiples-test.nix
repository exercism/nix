let
  inherit (import ./sum-of-multiples.nix) sumOfMultiples;
in
{
  "test no multiples within limit" = {
    expr = sumOfMultiples [ 3 5 ] 1;
    expected = 0;
  };

  "test one factor has multiples within limit" = {
    expr = sumOfMultiples [ 3 5 ] 4;
    expected = 3;
  };

  "test more than one multiple within limit" = {
    expr = sumOfMultiples [ 3 ] 7;
    expected = 9;
  };

  "test more than one factor with multiples within limit" = {
    expr = sumOfMultiples [ 3 5 ] 10;
    expected = 23;
  };

  "test each multiple is only counted once" = {
    expr = sumOfMultiples [ 3 5 ] 100;
    expected = 2318;
  };

  "test a much larger limit" = {
    expr = sumOfMultiples [ 3 5 ] 1000;
    expected = 233168;
  };

  "test three factors" = {
    expr = sumOfMultiples [ 7 13 17 ] 20;
    expected = 51;
  };

  "test factors not relatively prime" = {
    expr = sumOfMultiples [ 4 6 ] 15;
    expected = 30;
  };

  "test some pairs of factors relatively prime and some not" = {
    expr = sumOfMultiples [ 5 6 8 ] 150;
    expected = 4419;
  };

  "test one factor is a multiple of another" = {
    expr = sumOfMultiples [ 5 25 ] 51;
    expected = 275;
  };

  "test much larger factors" = {
    expr = sumOfMultiples [ 43 47 ] 10000;
    expected = 2203160;
  };

  "test all numbers are multiples of 1" = {
    expr = sumOfMultiples [ 1 ] 100;
    expected = 4950;
  };

  "test no factors means an empty sum" = {
    expr = sumOfMultiples [ ] 10000;
    expected = 0;
  };

  "test the only multiple of 0 is 0" = {
    expr = sumOfMultiples [ 0 ] 1;
    expected = 0;
  };

  "test the factor 0 does not affect the sum of multiples of other factors" = {
    expr = sumOfMultiples [ 3 0 ] 4;
    expected = 3;
  };

  "test solutions using include-exclude must extend to cardinality greater than 3" = {
    expr = sumOfMultiples [ 2 3 5 7 11 ] 10000;
    expected = 39614537;
  };
}
