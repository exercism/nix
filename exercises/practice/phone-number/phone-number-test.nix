let
  inherit (import ./.meta/example.nix) clean;
in
{
  "test cleans the number" = {
    expr = clean "(223) 456-7890";
    expected = "2234567890";
  };

  "test cleans numbers with dots" = {
    expr = clean "223.456.7890";
    expected = "2234567890";
  };

  "test cleans numbers with multiple spaces" = {
    expr = clean "223 456   7890   ";
    expected = "2234567890";
  };

  "test invalid when 9 digits" = {
    expr = clean "123456789";
    expectedError.type = "ThrownError";
    expectedError.msg = "must not be fewer than 10 digits";
  };

  "test invalid when 11 digits does not start with a 1" = {
    expr = clean "22234567890";
    expectedError.type = "ThrownError";
    expectedError.msg = "11 digits must start with 1";
  };

  "test valid when 11 digits and starting with 1" = {
    expr = clean "12234567890";
    expected = "2234567890";
  };

  "test valid when 11 digits and starting with 1 even with punctuation" = {
    expr = clean "+1 (223) 456-7890";
    expected = "2234567890";
  };

  "test invalid when more than 11 digits" = {
    expr = clean "321234567890";
    expectedError.type = "ThrownError";
    expectedError.msg = "must not be greater than 11 digits";
  };

  "test invalid with letters" = {
    expr = clean "523-abc-7890";
    expectedError.type = "ThrownError";
    expectedError.msg = "letters not permitted";
  };

  "test invalid with punctuations" = {
    expr = clean "523-@:!-7890";
    expectedError.type = "ThrownError";
    expectedError.msg = "punctuations not permitted";
  };

  "test invalid if area code starts with 0" = {
    expr = clean "(023) 456-7890";
    expectedError.type = "ThrownError";
    expectedError.msg = "area code cannot start with zero";
  };

  "test invalid if area code starts with 1" = {
    expr = clean "(123) 456-7890";
    expectedError.type = "ThrownError";
    expectedError.msg = "area code cannot start with one";
  };

  "test invalid if exchange code starts with 0" = {
    expr = clean "(223) 056-7890";
    expectedError.type = "ThrownError";
    expectedError.msg = "exchange code cannot start with zero";
  };

  "test invalid if exchange code starts with 1" = {
    expr = clean "(223) 156-7890";
    expectedError.type = "ThrownError";
    expectedError.msg = "exchange code cannot start with one";
  };

  "test invalid if area code starts with 0 on valid 11-digit number" = {
    expr = clean "1 (023) 456-7890";
    expectedError.type = "ThrownError";
    expectedError.msg = "area code cannot start with zero";
  };

  "test invalid if area code starts with 1 on valid 11-digit number" = {
    expr = clean "1 (123) 456-7890";
    expectedError.type = "ThrownError";
    expectedError.msg = "area code cannot start with one";
  };

  "test invalid if exchange code starts with 0 on valid 11-digit number" = {
    expr = clean "1 (223) 056-7890";
    expectedError.type = "ThrownError";
    expectedError.msg = "exchange code cannot start with zero";
  };

  "test invalid if exchange code starts with 1 on valid 11-digit number" = {
    expr = clean "1 (223) 156-7890";
    expectedError.type = "ThrownError";
    expectedError.msg = "exchange code cannot start with one";
  };
}
