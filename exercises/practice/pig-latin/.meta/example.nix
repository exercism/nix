let
  inherit (import <nixpkgs/lib>)
    pipe
    hasPrefix
    stringToCharacters
    concatStringsSep
    splitString
    ;

  isVowel =
    c:
    builtins.elem c [
      "a"
      "e"
      "i"
      "o"
      "u"
    ];

  splitIndex =
    chars: i:
    let
      c = builtins.elemAt chars i;
    in
    if isVowel c || (c == "y" && i > 0) then
      i
    else if c == "q" && i + 1 < builtins.length chars && builtins.elemAt chars (i + 1) == "u" then
      i + 2
    else
      splitIndex chars (i + 1);

  moveIndex =
    word:
    if hasPrefix "xr" word || hasPrefix "yt" word || isVowel (builtins.substring 0 1 word) then
      0
    else
      splitIndex (stringToCharacters word) 0;

  translateWord =
    word:
    let
      i = moveIndex word;
      len = builtins.stringLength word;
    in
    builtins.substring i (len - i) word + builtins.substring 0 i word + "ay";
in
{
  translate =
    phrase:
    pipe phrase [
      (splitString " ")
      (map translateWord)
      (concatStringsSep " ")
    ];
}
