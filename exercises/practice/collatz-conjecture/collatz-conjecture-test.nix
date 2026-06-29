let
  inherit (import ./collatz-conjecture.nix) steps;
in
{
  "test zero steps for one" = {
    expr = steps 1;
    expected = 0;
  };

  "test divide if even" = {
    expr = steps 16;
    expected = 4;
  };

  "test even and odd steps" = {
    expr = steps 12;
    expected = 9;
  };

  "test large number of even and odd steps" = {
    expr = steps 1000000;
    expected = 152;
  };

  "test zero is an error" = {
    expr = steps 0;
    expectedError.type = "ThrownError";
    expectedError.msg = "Only positive integers are allowed";
  };

  "test negative value is an error" = {
    expr = steps (-15);
    expectedError.type = "ThrownError";
    expectedError.msg = "Only positive integers are allowed";
  };
}
