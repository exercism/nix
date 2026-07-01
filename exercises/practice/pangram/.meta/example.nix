let
  inherit (import <nixpkgs/lib>) stringToCharacters toLower;
in
{
  isPangram =
    sentence:
    let
      letters = stringToCharacters "abcdefghijklmnopqrstuvwxyz";
      sentenceChars = stringToCharacters (toLower sentence);
    in
    builtins.all (letter: builtins.elem letter sentenceChars) letters;
}
