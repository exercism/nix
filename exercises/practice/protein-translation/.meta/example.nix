let
  lib = import <nixpkgs/lib>;
  inherit (lib)
    genList
    substring
    stringLength
    take
    ;
  inherit (lib.lists) findFirstIndex;
  codonTable = {
    AUG = "Methionine";
    UUU = "Phenylalanine";
    UUC = "Phenylalanine";
    UUA = "Leucine";
    UUG = "Leucine";
    UCU = "Serine";
    UCC = "Serine";
    UCA = "Serine";
    UCG = "Serine";
    UAU = "Tyrosine";
    UAC = "Tyrosine";
    UGU = "Cysteine";
    UGC = "Cysteine";
    UGG = "Tryptophan";
    UAA = "STOP";
    UAG = "STOP";
    UGA = "STOP";
  };
in
{
  proteins =
    strand:
    let
      totalCodons = (stringLength strand + 2) / 3;
      codons = genList (i: substring (i * 3) 3 strand) totalCodons;
      translated = map (codon: codonTable.${codon} or (throw "Invalid codon")) codons;
      limit = findFirstIndex (protein: protein == "STOP") (builtins.length translated) translated;
    in
    take limit translated;
}
