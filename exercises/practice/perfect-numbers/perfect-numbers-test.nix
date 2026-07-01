let
  inherit (import ./perfect-numbers.nix) classify;
in
{
  "test smallest perfect number is classified correctly" = {
    expr = classify 6;
    expected = "perfect";
  };

  "test medium perfect number is classified correctly" = {
    expr = classify 28;
    expected = "perfect";
  };

  "test large perfect number is classified correctly" = {
    expr = classify 33550336;
    expected = "perfect";
  };

  "test smallest abundant number is classified correctly" = {
    expr = classify 12;
    expected = "abundant";
  };

  "test medium abundant number is classified correctly" = {
    expr = classify 30;
    expected = "abundant";
  };

  "test large abundant number is classified correctly" = {
    expr = classify 33550335;
    expected = "abundant";
  };

  "test perfect square abundant number is classified correctly" = {
    expr = classify 196;
    expected = "abundant";
  };

  "test smallest prime deficient number is classified correctly" = {
    expr = classify 2;
    expected = "deficient";
  };

  "test smallest non-prime deficient number is classified correctly" = {
    expr = classify 4;
    expected = "deficient";
  };

  "test medium deficient number is classified correctly" = {
    expr = classify 32;
    expected = "deficient";
  };

  "test large deficient number is classified correctly" = {
    expr = classify 33550337;
    expected = "deficient";
  };

  "test edge case (no factors other than itself) is classified correctly" = {
    expr = classify 1;
    expected = "deficient";
  };

  "test zero is rejected (as it is not a positive integer)" = {
    expr = classify 0;
    expectedError.type = "ThrownError";
    expectedError.msg = "Classification is only possible for positive integers.";
  };

  "test negative integer is rejected (as it is not a positive integer)" = {
    expr = classify (-1);
    expectedError.type = "ThrownError";
    expectedError.msg = "Classification is only possible for positive integers.";
  };
}
