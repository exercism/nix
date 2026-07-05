let
  inherit (import ./luhn.nix) isValid;
in
{
  "test single digit strings can not be valid" = {
    expr = isValid "1";
    expected = false;
  };

  "test a single zero is invalid" = {
    expr = isValid "0";
    expected = false;
  };

  "test a simple valid SIN that remains valid if reversed" = {
    expr = isValid "059";
    expected = true;
  };

  "test a simple valid SIN that becomes invalid if reversed" = {
    expr = isValid "59";
    expected = true;
  };

  "test a valid Canadian SIN" = {
    expr = isValid "055 444 285";
    expected = true;
  };

  "test invalid Canadian SIN" = {
    expr = isValid "055 444 286";
    expected = false;
  };

  "test invalid credit card" = {
    expr = isValid "8273 1232 7352 0569";
    expected = false;
  };

  "test invalid long number with an even remainder" = {
    expr = isValid "1 2345 6789 1234 5678 9012";
    expected = false;
  };

  "test invalid long number with a remainder divisible by 5" = {
    expr = isValid "1 2345 6789 1234 5678 9013";
    expected = false;
  };

  "test valid number with an even number of digits" = {
    expr = isValid "095 245 88";
    expected = true;
  };

  "test valid number with an odd number of spaces" = {
    expr = isValid "234 567 891 234";
    expected = true;
  };

  "test valid strings with a non-digit added at the end become invalid" = {
    expr = isValid "059a";
    expected = false;
  };

  "test valid strings with punctuation included become invalid" = {
    expr = isValid "055-444-285";
    expected = false;
  };

  "test valid strings with symbols included become invalid" = {
    expr = isValid "055# 444$ 285";
    expected = false;
  };

  "test single zero with space is invalid" = {
    expr = isValid " 0";
    expected = false;
  };

  "test more than a single zero is valid" = {
    expr = isValid "0000 0";
    expected = true;
  };

  "test input digit 9 is correctly converted to output digit 9" = {
    expr = isValid "091";
    expected = true;
  };

  "test very long input is valid" = {
    expr = isValid "9999999999 9999999999 9999999999 9999999999";
    expected = true;
  };

  "test valid luhn with an odd number of digits and non zero first digit" = {
    expr = isValid "109";
    expected = true;
  };

  "test using ascii value for non-doubled non-digit isn't allowed" = {
    expr = isValid "055b 444 285";
    expected = false;
  };

  "test using ascii value for doubled non-digit isn't allowed" = {
    expr = isValid ":9";
    expected = false;
  };

  "test non-numeric, non-space char in the middle with a sum that's divisible by 10 isn't allowed" = {
    expr = isValid "59%59";
    expected = false;
  };
}
