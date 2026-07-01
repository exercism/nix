let
  inherit (import ./leap.nix) isLeapYear;
in
{
  "test year not divisible by 4 in common year" = {
    expr = isLeapYear 2015;
    expected = false;
  };

  "test year divisible by 2, not divisible by 4 in common year" = {
    expr = isLeapYear 1970;
    expected = false;
  };

  "test year divisible by 4, not divisible by 100 in leap year" = {
    expr = isLeapYear 1996;
    expected = true;
  };

  "test year divisible by 4 and 5 is still a leap year" = {
    expr = isLeapYear 1960;
    expected = true;
  };

  "test year divisible by 100, not divisible by 400 in common year" = {
    expr = isLeapYear 2100;
    expected = false;
  };

  "test year divisible by 100 but not by 3 is still not a leap year" = {
    expr = isLeapYear 1900;
    expected = false;
  };

  "test year divisible by 400 is leap year" = {
    expr = isLeapYear 2000;
    expected = true;
  };

  "test year divisible by 400 but not by 125 is still a leap year" = {
    expr = isLeapYear 2400;
    expected = true;
  };

  "test year divisible by 200, not divisible by 400 in common year" = {
    expr = isLeapYear 1800;
    expected = false;
  };
}
