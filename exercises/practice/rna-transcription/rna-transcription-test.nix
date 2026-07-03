let
  inherit (import ./rna-transcription.nix) toRna;
in
{
  "test empty RNA sequence" = {
    expr = toRna "";
    expected = "";
  };

  "test RNA complement of cytosine is guanine" = {
    expr = toRna "C";
    expected = "G";
  };

  "test RNA complement of guanine is cytosine" = {
    expr = toRna "G";
    expected = "C";
  };

  "test RNA complement of thymine is adenine" = {
    expr = toRna "T";
    expected = "A";
  };

  "test RNA complement of adenine is uracil" = {
    expr = toRna "A";
    expected = "U";
  };

  "test RNA complement" = {
    expr = toRna "ACGTGGTCTTAA";
    expected = "UGCACCAGAAUU";
  };

  "test correctly handles invalid input" = {
    expr = toRna "U";
    expectedError.type = "ThrownError";
    expectedError.msg = "Bad strand";
  };

  "test correctly handles completely invalid input" = {
    expr = toRna "XXX";
    expectedError.type = "ThrownError";
    expectedError.msg = "Bad strand";
  };

  "test correctly handles partially invalid input" = {
    expr = toRna "ACGTXXXCTTAA";
    expectedError.type = "ThrownError";
    expectedError.msg = "Bad strand";
  };
}
