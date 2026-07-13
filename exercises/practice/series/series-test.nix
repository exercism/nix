let
  inherit (import ./series.nix) slices;
in
{
  "test slices of one from one" = {
    expr = slices "1" 1;
    expected = [ "1" ];
  };

  "test slices of one from two" = {
    expr = slices "12" 1;
    expected = [
      "1"
      "2"
    ];
  };

  "test slices of two" = {
    expr = slices "35" 2;
    expected = [ "35" ];
  };

  "test slices of two overlap" = {
    expr = slices "9142" 2;
    expected = [
      "91"
      "14"
      "42"
    ];
  };

  "test slices can include duplicates" = {
    expr = slices "777777" 3;
    expected = [
      "777"
      "777"
      "777"
      "777"
    ];
  };

  "test slices of a long series" = {
    expr = slices "918493904243" 5;
    expected = [
      "91849"
      "18493"
      "84939"
      "49390"
      "93904"
      "39042"
      "90424"
      "04243"
    ];
  };

  "test slice length is too large" = {
    expr = slices "12345" 6;
    expectedError.type = "ThrownError";
    expectedError.msg = "slice length cannot be greater than series length";
  };

  "test slice length is way too large" = {
    expr = slices "12345" 42;
    expectedError.type = "ThrownError";
    expectedError.msg = "slice length cannot be greater than series length";
  };

  "test slice length cannot be zero" = {
    expr = slices "12345" 0;
    expectedError.type = "ThrownError";
    expectedError.msg = "slice length cannot be zero";
  };

  "test slice length cannot be negative" = {
    expr = slices "123" (-1);
    expectedError.type = "ThrownError";
    expectedError.msg = "slice length cannot be negative";
  };

  "test empty series is invalid" = {
    expr = slices "" 1;
    expectedError.type = "ThrownError";
    expectedError.msg = "series cannot be empty";
  };
}
