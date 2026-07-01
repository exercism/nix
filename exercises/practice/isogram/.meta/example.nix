let
  inherit (import <nixpkgs/lib>)
    stringToCharacters
    replaceStrings
    allUnique
    pipe
    toLower
    ;
in
{
  isIsogram =
    str:
    pipe str [
      (replaceStrings [ " " "-" ] [ "" "" ])
      toLower
      stringToCharacters
      allUnique
    ];
}
