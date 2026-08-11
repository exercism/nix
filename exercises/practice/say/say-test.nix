let
  inherit (import ./.meta/example.nix) say;
in
{
  "test zero" = {
    expr = say 0;
    expected = "zero";
  };

  "test one" = {
    expr = say 1;
    expected = "one";
  };

  "test fourteen" = {
    expr = say 14;
    expected = "fourteen";
  };

  "test twenty" = {
    expr = say 20;
    expected = "twenty";
  };

  "test twenty-two" = {
    expr = say 22;
    expected = "twenty-two";
  };

  "test thirty" = {
    expr = say 30;
    expected = "thirty";
  };

  "test ninety-nine" = {
    expr = say 99;
    expected = "ninety-nine";
  };

  "test one hundred" = {
    expr = say 100;
    expected = "one hundred";
  };

  "test one hundred twenty-three" = {
    expr = say 123;
    expected = "one hundred twenty-three";
  };

  "test two hundred" = {
    expr = say 200;
    expected = "two hundred";
  };

  "test nine hundred ninety-nine" = {
    expr = say 999;
    expected = "nine hundred ninety-nine";
  };

  "test one thousand" = {
    expr = say 1000;
    expected = "one thousand";
  };

  "test one thousand two hundred thirty-four" = {
    expr = say 1234;
    expected = "one thousand two hundred thirty-four";
  };

  "test one million" = {
    expr = say 1000000;
    expected = "one million";
  };

  "test one million two thousand three hundred forty-five" = {
    expr = say 1002345;
    expected = "one million two thousand three hundred forty-five";
  };

  "test one billion" = {
    expr = say 1000000000;
    expected = "one billion";
  };

  "test a big number" = {
    expr = say 987654321123;
    expected = "nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three";
  };

  "test numbers below zero are out of range" = {
    expr = say (-1);
    expectedError.type = "ThrownError";
    expectedError.msg = "input out of range";
  };

  "test numbers above 999,999,999,999 are out of range" = {
    expr = say 1000000000000;
    expectedError.type = "ThrownError";
    expectedError.msg = "input out of range";
  };
}
