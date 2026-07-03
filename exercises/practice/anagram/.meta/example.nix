let
  inherit (import <nixpkgs/lib>)
    toLower
    stringToCharacters
    pipe
    concatStrings
    ;
  sortString =
    str:
    pipe str [
      stringToCharacters
      (builtins.sort (a: b: a < b))
      concatStrings
    ];
in
{
  findAnagrams =
    target: words:
    let
      lowerTarget = toLower target;
      sortedTarget = sortString lowerTarget;
    in
    builtins.filter (
      word:
      let
        lowerWord = toLower word;
      in
      lowerWord != lowerTarget && sortedTarget == sortString lowerWord
    ) words;
}
