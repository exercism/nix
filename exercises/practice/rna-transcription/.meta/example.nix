let
  inherit (import <nixpkgs/lib>) stringAsChars;
  trancribeNucleotide =
    nucleotide:
    if nucleotide == "A" then
      "U"
    else if nucleotide == "T" then
      "A"
    else if nucleotide == "C" then
      "G"
    else if nucleotide == "G" then
      "C"
    else
      throw "Bad strand";
in
{
  toRna = stringAsChars trancribeNucleotide;
}
