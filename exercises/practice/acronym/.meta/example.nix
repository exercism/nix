let
  inherit (import <nixpkgs/lib>)
    replaceStrings
    concatMapStrings
    pipe
    toUpper
    splitString
    ;
in
{
  abbreviate =
    phrase:
    pipe phrase [
      toUpper
      (replaceStrings [ "'" "_" "-" ] [ "" "" " " ])
      (splitString " ")
      (concatMapStrings (builtins.substring 0 1))
    ];
}
