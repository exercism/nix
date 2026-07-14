let
  inherit (import ./all-your-base.nix) rebase;
in
{
  "test single bit one to decimal" = {
    expr = rebase 2 [ 1 ] 10;
    expected = [ 1 ];
  };

  "test binary to single decimal" = {
    expr = rebase 2 [ 1 0 1 ] 10;
    expected = [ 5 ];
  };

  "test single decimal to binary" = {
    expr = rebase 10 [ 5 ] 2;
    expected = [
      1
      0
      1
    ];
  };

  "test binary to multiple decimal" = {
    expr = rebase 2 [ 1 0 1 0 1 0 ] 10;
    expected = [
      4
      2
    ];
  };

  "test decimal to binary" = {
    expr = rebase 10 [ 4 2 ] 2;
    expected = [
      1
      0
      1
      0
      1
      0
    ];
  };

  "test trinary to hexadecimal" = {
    expr = rebase 3 [ 1 1 2 0 ] 16;
    expected = [
      2
      10
    ];
  };

  "test hexadecimal to trinary" = {
    expr = rebase 16 [ 2 10 ] 3;
    expected = [
      1
      1
      2
      0
    ];
  };

  "test fifteen bit integer" = {
    expr = rebase 97 [ 3 46 60 ] 73;
    expected = [
      6
      10
      45
    ];
  };

  "test empty list" = {
    expr = rebase 2 [ ] 10;
    expected = [ 0 ];
  };

  "test single zero" = {
    expr = rebase 10 [ 0 ] 2;
    expected = [ 0 ];
  };

  "test multiple zeros" = {
    expr = rebase 10 [ 0 0 0 ] 2;
    expected = [ 0 ];
  };

  "test leading zeros" = {
    expr = rebase 7 [ 0 6 0 ] 10;
    expected = [
      4
      2
    ];
  };

  "test input base is one" = {
    expr = rebase 1 [ 0 ] 10;
    expectedError.type = "ThrownError";
    expectedError.msg = "input base must be >= 2";
  };

  "test input base is zero" = {
    expr = rebase 0 [ ] 10;
    expectedError.type = "ThrownError";
    expectedError.msg = "input base must be >= 2";
  };

  "test input base is negative" = {
    expr = rebase (-2) [ 1 ] 10;
    expectedError.type = "ThrownError";
    expectedError.msg = "input base must be >= 2";
  };

  "test negative digit" = {
    expr = rebase 2 [
      1
      (-1)
      1
      0
      1
      0
    ] 10;
    expectedError.type = "ThrownError";
    expectedError.msg = "all digits must satisfy 0 <= d < input base";
  };

  "test invalid positive digit" = {
    expr = rebase 2 [ 1 2 1 0 1 0 ] 10;
    expectedError.type = "ThrownError";
    expectedError.msg = "all digits must satisfy 0 <= d < input base";
  };

  "test output base is one" = {
    expr = rebase 2 [ 1 0 1 0 1 0 ] 1;
    expectedError.type = "ThrownError";
    expectedError.msg = "output base must be >= 2";
  };

  "test output base is zero" = {
    expr = rebase 10 [ 7 ] 0;
    expectedError.type = "ThrownError";
    expectedError.msg = "output base must be >= 2";
  };

  "test output base is negative" = {
    expr = rebase 2 [ 1 ] (-7);
    expectedError.type = "ThrownError";
    expectedError.msg = "output base must be >= 2";
  };

  "test both bases are negative" = {
    expr = rebase (-2) [ 1 ] (-7);
    expectedError.type = "ThrownError";
    expectedError.msg = "input base must be >= 2";
  };
}
