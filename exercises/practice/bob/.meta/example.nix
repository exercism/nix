let
  inherit (import <nixpkgs/lib>)
    toUpper
    toLower
    hasSuffix
    trim
    ;
  isShout = str: toUpper str != toLower str && toUpper str == str;
  isQuestion = hasSuffix "?";
in
{
  response =
    str:
    let
      trimmed = trim str;
    in
    if trimmed == "" then
      "Fine. Be that way!"
    else if isQuestion trimmed && isShout trimmed then
      "Calm down, I know what I'm doing!"
    else if isShout trimmed then
      "Whoa, chill out!"
    else if isQuestion trimmed then
      "Sure."
    else
      "Whatever.";
}
