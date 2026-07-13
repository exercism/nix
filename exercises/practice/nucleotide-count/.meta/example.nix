let
  inherit (import <nixpkgs/lib>) stringToCharacters elem;
  initialCounts = {
    A = 0;
    C = 0;
    G = 0;
    T = 0;
  };
  validNucleotides = [
    "A"
    "C"
    "G"
    "T"
  ];
in
{
  nucleotideCounts =
    strand:
    let
      nucleotides = stringToCharacters strand;
    in
    if builtins.any (n: !elem n validNucleotides) nucleotides then
      throw "Invalid nucleotide in strand"
    else
      builtins.foldl' (
        counts: nucleotide: counts // { ${nucleotide} = counts.${nucleotide} + 1; }
      ) initialCounts nucleotides;
}
