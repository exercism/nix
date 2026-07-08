let
  inherit (import ./booleans.nix) leapYear;
in
{
  "test year not divisible by 4" = {
    expr = leapYear 2015;
    expected = false;
  };

  "test year divisible by 2 not by 4" = {
    expr = leapYear 1970;
    expected = false;
  };

  "test year divisible by 4 not by 100" = {
    expr = leapYear 1996;
    expected = true;
  };

  "test year divisible by 4 and 5" = {
    expr = leapYear 1960;
    expected = true;
  };

  "test year divisible by 100 not by 400" = {
    expr = leapYear 2100;
    expected = false;
  };

  "test year divisible by 100 not by 3" = {
    expr = leapYear 1900;
    expected = false;
  };

  "test year divisible by 400" = {
    expr = leapYear 2000;
    expected = true;
  };

  "test year divisible by 400 not by 125" = {
    expr = leapYear 2400;
    expected = true;
  };

  "test year divisible by 200 not by 400" = {
    expr = leapYear 1800;
    expected = false;
  };
}
