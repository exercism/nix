let
  inherit (import ./nucleotide-count.nix) nucleotideCounts;
in
{
  "test empty strand" = {
    expr = nucleotideCounts "";
    expected = {
      "A" = 0;
      "C" = 0;
      "G" = 0;
      "T" = 0;
    };
  };

  "test can count one nucleotide in single-character input" = {
    expr = nucleotideCounts "G";
    expected = {
      "A" = 0;
      "C" = 0;
      "G" = 1;
      "T" = 0;
    };
  };

  "test strand with repeated nucleotide" = {
    expr = nucleotideCounts "GGGGGGG";
    expected = {
      "A" = 0;
      "C" = 0;
      "G" = 7;
      "T" = 0;
    };
  };

  "test strand with multiple nucleotides" = {
    expr = nucleotideCounts "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC";
    expected = {
      "A" = 20;
      "C" = 12;
      "G" = 17;
      "T" = 21;
    };
  };

  "test strand with invalid nucleotides" = {
    expr = nucleotideCounts "AGXXACT";
    expectedError.type = "ThrownError";
    expectedError.msg = "Invalid nucleotide in strand";
  };
}
