let
  inherit (import <nixpkgs/lib>)
    stringToCharacters
    zipListsWith
    count
    id
    ;
in
{
  distance =
    strand1: strand2:
    if builtins.stringLength strand1 != builtins.stringLength strand2 then
      throw "strands must be of equal length"
    else
      let
        nucleotides1 = stringToCharacters strand1;
        nucleotides2 = stringToCharacters strand2;
      in
      count id (zipListsWith (a: b: a != b) nucleotides1 nucleotides2);
}
