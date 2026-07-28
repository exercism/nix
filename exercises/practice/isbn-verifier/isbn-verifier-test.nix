let
  inherit (import ./isbn-verifier.nix) isValid;
in
{
  "test valid isbn" = {
    expr = isValid "3-598-21508-8";
    expected = true;
  };

  "test invalid isbn check digit" = {
    expr = isValid "3-598-21508-9";
    expected = false;
  };

  "test valid isbn with a check digit of 10" = {
    expr = isValid "3-598-21507-X";
    expected = true;
  };

  "test check digit is a character other than X" = {
    expr = isValid "3-598-21507-A";
    expected = false;
  };

  "test invalid check digit in isbn is not treated as zero" = {
    expr = isValid "4-598-21507-B";
    expected = false;
  };

  "test invalid character in isbn is not treated as zero" = {
    expr = isValid "3-598-P1581-X";
    expected = false;
  };

  "test X is only valid as a check digit" = {
    expr = isValid "3-598-2X507-9";
    expected = false;
  };

  "test only one check digit is allowed" = {
    expr = isValid "3-598-21508-96";
    expected = false;
  };

  "test X is not substituted by the value 10" = {
    expr = isValid "3-598-2X507-5";
    expected = false;
  };

  "test valid isbn without separating dashes" = {
    expr = isValid "3598215088";
    expected = true;
  };

  "test isbn without separating dashes and X as check digit" = {
    expr = isValid "359821507X";
    expected = true;
  };

  "test isbn without check digit and dashes" = {
    expr = isValid "359821507";
    expected = false;
  };

  "test too long isbn and no dashes" = {
    expr = isValid "3598215078X";
    expected = false;
  };

  "test too short isbn" = {
    expr = isValid "00";
    expected = false;
  };

  "test isbn without check digit" = {
    expr = isValid "3-598-21507";
    expected = false;
  };

  "test check digit of X should not be used for 0" = {
    expr = isValid "3-598-21515-X";
    expected = false;
  };

  "test empty isbn" = {
    expr = isValid "";
    expected = false;
  };

  "test input is 9 characters" = {
    expr = isValid "134456729";
    expected = false;
  };

  "test invalid characters are not ignored after checking length" = {
    expr = isValid "3132P34035";
    expected = false;
  };

  "test invalid characters are not ignored before checking length" = {
    expr = isValid "3598P215088";
    expected = false;
  };

  "test input is too long but contains a valid isbn" = {
    expr = isValid "98245726788";
    expected = false;
  };
}
