let
  inherit (import ./isogram.nix) isIsogram;
in
{
  "test empty string" = {
    expr = isIsogram "";
    expected = true;
  };

  "test isogram with only lower case characters" = {
    expr = isIsogram "isogram";
    expected = true;
  };

  "test word with one duplicated character" = {
    expr = isIsogram "eleven";
    expected = false;
  };

  "test word with one duplicated character from the end of the alphabet" = {
    expr = isIsogram "zzyzx";
    expected = false;
  };

  "test longest reported english isogram" = {
    expr = isIsogram "subdermatoglyphic";
    expected = true;
  };

  "test word with duplicated character in mixed case" = {
    expr = isIsogram "Alphabet";
    expected = false;
  };

  "test word with duplicated character in mixed case, lowercase first" = {
    expr = isIsogram "alphAbet";
    expected = false;
  };

  "test hypothetical isogrammic word with hyphen" = {
    expr = isIsogram "thumbscrew-japingly";
    expected = true;
  };

  "test hypothetical word with duplicated character following hyphen" = {
    expr = isIsogram "thumbscrew-jappingly";
    expected = false;
  };

  "test isogram with duplicated hyphen" = {
    expr = isIsogram "six-year-old";
    expected = true;
  };

  "test made-up name that is an isogram" = {
    expr = isIsogram "Emily Jung Schwartzkopf";
    expected = true;
  };

  "test duplicated character in the middle" = {
    expr = isIsogram "accentor";
    expected = false;
  };

  "test same first and last characters" = {
    expr = isIsogram "angola";
    expected = false;
  };

  "test word with duplicated character and with two hyphens" = {
    expr = isIsogram "up-to-date";
    expected = false;
  };
}
