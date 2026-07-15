let
  inherit (import ./protein-translation.nix) proteins;
in
{
  "test empty rna sequence results in no proteins" = {
    expr = proteins "";
    expected = [ ];
  };

  "test methionine rna sequence" = {
    expr = proteins "AUG";
    expected = [ "Methionine" ];
  };

  "test phenylalanine rna sequence 1" = {
    expr = proteins "UUU";
    expected = [ "Phenylalanine" ];
  };

  "test phenylalanine rna sequence 2" = {
    expr = proteins "UUC";
    expected = [ "Phenylalanine" ];
  };

  "test leucine rna sequence 1" = {
    expr = proteins "UUA";
    expected = [ "Leucine" ];
  };

  "test leucine rna sequence 2" = {
    expr = proteins "UUG";
    expected = [ "Leucine" ];
  };

  "test serine rna sequence 1" = {
    expr = proteins "UCU";
    expected = [ "Serine" ];
  };

  "test serine rna sequence 2" = {
    expr = proteins "UCC";
    expected = [ "Serine" ];
  };

  "test serine rna sequence 3" = {
    expr = proteins "UCA";
    expected = [ "Serine" ];
  };

  "test serine rna sequence 4" = {
    expr = proteins "UCG";
    expected = [ "Serine" ];
  };

  "test tyrosine rna sequence 1" = {
    expr = proteins "UAU";
    expected = [ "Tyrosine" ];
  };

  "test tyrosine rna sequence 2" = {
    expr = proteins "UAC";
    expected = [ "Tyrosine" ];
  };

  "test cysteine rna sequence 1" = {
    expr = proteins "UGU";
    expected = [ "Cysteine" ];
  };

  "test cysteine rna sequence 2" = {
    expr = proteins "UGC";
    expected = [ "Cysteine" ];
  };

  "test tryptophan rna sequence" = {
    expr = proteins "UGG";
    expected = [ "Tryptophan" ];
  };

  "test stop codon rna sequence 1" = {
    expr = proteins "UAA";
    expected = [ ];
  };

  "test stop codon rna sequence 2" = {
    expr = proteins "UAG";
    expected = [ ];
  };

  "test stop codon rna sequence 3" = {
    expr = proteins "UGA";
    expected = [ ];
  };

  "test sequence of two protein codons translates into proteins" = {
    expr = proteins "UUUUUU";
    expected = [
      "Phenylalanine"
      "Phenylalanine"
    ];
  };

  "test sequence of two different protein codons translates into proteins" = {
    expr = proteins "UUAUUG";
    expected = [
      "Leucine"
      "Leucine"
    ];
  };

  "test translate rna strand into correct protein list" = {
    expr = proteins "AUGUUUUGG";
    expected = [
      "Methionine"
      "Phenylalanine"
      "Tryptophan"
    ];
  };

  "test translation stops if stop codon at beginning of sequence" = {
    expr = proteins "UAGUGG";
    expected = [ ];
  };

  "test translation stops if stop codon at end of two-codon sequence" = {
    expr = proteins "UGGUAG";
    expected = [ "Tryptophan" ];
  };

  "test translation stops if stop codon at end of three-codon sequence" = {
    expr = proteins "AUGUUUUAA";
    expected = [
      "Methionine"
      "Phenylalanine"
    ];
  };

  "test translation stops if stop codon in middle of three-codon sequence" = {
    expr = proteins "UGGUAGUGG";
    expected = [ "Tryptophan" ];
  };

  "test translation stops if stop codon in middle of six-codon sequence" = {
    expr = proteins "UGGUGUUAUUAAUGGUUU";
    expected = [
      "Tryptophan"
      "Cysteine"
      "Tyrosine"
    ];
  };

  "test sequence of two non-stop codons does not translate to a stop codon" = {
    expr = proteins "AUGAUG";
    expected = [
      "Methionine"
      "Methionine"
    ];
  };

  "test unknown amino acids, not part of a codon, can't translate" = {
    expr = proteins "XYZ";
    expectedError.type = "ThrownError";
    expectedError.msg = "Invalid codon";
  };

  "test incomplete rna sequence can't translate" = {
    expr = proteins "AUGU";
    expectedError.type = "ThrownError";
    expectedError.msg = "Invalid codon";
  };

  "test incomplete rna sequence can translate if valid until a stop codon" = {
    expr = proteins "UUCUUCUAAUGGU";
    expected = [
      "Phenylalanine"
      "Phenylalanine"
    ];
  };
}
