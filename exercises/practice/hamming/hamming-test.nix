let
  inherit (import ./hamming.nix) distance;
in
{
  "test empty strands" = {
    expr = distance "" "";
    expected = 0;
  };

  "test single letter identical strands" = {
    expr = distance "A" "A";
    expected = 0;
  };

  "test single letter different strands" = {
    expr = distance "G" "T";
    expected = 1;
  };

  "test long identical strands" = {
    expr = distance "GGACTGAAATCTG" "GGACTGAAATCTG";
    expected = 0;
  };

  "test long different strands" = {
    expr = distance "GGACGGATTCTG" "AGGACGGATTCT";
    expected = 9;
  };

  "test disallow first strand longer" = {
    expr = distance "AATG" "AAA";
    expectedError.type = "ThrownError";
    expectedError.msg = "strands must be of equal length";
  };

  "test disallow second strand longer" = {
    expr = distance "ATA" "AGTG";
    expectedError.type = "ThrownError";
    expectedError.msg = "strands must be of equal length";
  };

  "test disallow empty first strand" = {
    expr = distance "" "G";
    expectedError.type = "ThrownError";
    expectedError.msg = "strands must be of equal length";
  };

  "test disallow empty second strand" = {
    expr = distance "G" "";
    expectedError.type = "ThrownError";
    expectedError.msg = "strands must be of equal length";
  };
}
