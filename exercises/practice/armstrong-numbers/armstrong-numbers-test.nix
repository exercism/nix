let
  inherit (import ./armstrong-numbers.nix) isArmstrongNumber;
in
{
  "test zero is an Armstrong number" = {
    expr = isArmstrongNumber 0;
    expected = true;
  };

  "test single-digit numbers are Armstrong numbers" = {
    expr = isArmstrongNumber 5;
    expected = true;
  };

  "test there are no two-digit Armstrong numbers" = {
    expr = isArmstrongNumber 10;
    expected = false;
  };

  "test three-digit number that is an Armstrong number" = {
    expr = isArmstrongNumber 153;
    expected = true;
  };

  "test three-digit number that is not an Armstrong number" = {
    expr = isArmstrongNumber 100;
    expected = false;
  };

  "test four-digit number that is an Armstrong number" = {
    expr = isArmstrongNumber 9474;
    expected = true;
  };

  "test four-digit that is not an Armstrong number" = {
    expr = isArmstrongNumber 9475;
    expected = false;
  };

  "test seven-digit number that is an Armstrong number" = {
    expr = isArmstrongNumber 9926315;
    expected = true;
  };

  "test seven-digit number that is not an Armstrong number" = {
    expr = isArmstrongNumber 9926314;
    expected = false;
  };
}
