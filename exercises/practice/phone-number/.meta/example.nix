let
  inherit (import <nixpkgs/lib>) pipe;

  allowedPunctuation = [
    "+"
    "-"
    "."
    " "
    "("
    ")"
  ];

  stripPunctuation = s: builtins.replaceStrings allowedPunctuation (map (_: "") allowedPunctuation) s;

  checkNoLetters =
    s: if builtins.match ".*[a-zA-Z].*" s != null then throw "letters not permitted" else s;

  checkOnlyDigits =
    s: if builtins.match "[0-9]*" s == null then throw "punctuations not permitted" else s;

  checkValidLength =
    s:
    let
      len = builtins.stringLength s;
    in
    if len < 10 then
      throw "must not be fewer than 10 digits"
    else if len > 11 then
      throw "must not be greater than 11 digits"
    else
      s;

  stripLeadingCountryCode =
    s:
    if builtins.stringLength s == 11 then
      if builtins.substring 0 1 s == "1" then
        builtins.substring 1 10 s
      else
        throw "11 digits must start with 1"
    else
      s;

  checkValidAreaCode =
    s:
    if builtins.substring 0 1 s == "0" then
      throw "area code cannot start with zero"
    else if builtins.substring 0 1 s == "1" then
      throw "area code cannot start with one"
    else
      s;

  checkValidExchangeCode =
    s:
    if builtins.substring 3 1 s == "0" then
      throw "exchange code cannot start with zero"
    else if builtins.substring 3 1 s == "1" then
      throw "exchange code cannot start with one"
    else
      s;
in
{
  clean =
    raw:
    pipe raw [
      stripPunctuation
      checkNoLetters
      checkOnlyDigits
      checkValidLength
      stripLeadingCountryCode
      checkValidAreaCode
      checkValidExchangeCode
    ];
}
