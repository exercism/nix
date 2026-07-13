let
  inherit (import <nixpkgs/lib>) stringToCharacters;
  pairs = {
    ")" = "(";
    "]" = "[";
    "}" = "{";
  };
  isOpen =
    c:
    builtins.elem c [
      "("
      "["
      "{"
    ];
  isClose =
    c:
    builtins.elem c [
      ")"
      "]"
      "}"
    ];
  go =
    stack: chars:
    if chars == [ ] then
      stack == [ ]
    else
      let
        c = builtins.head chars;
        rest = builtins.tail chars;
      in
      if isOpen c then
        go ([ c ] ++ stack) rest
      else if isClose c then
        stack != [ ] && builtins.head stack == pairs.${c} && go (builtins.tail stack) rest
      else
        go stack rest;
in
{
  isPaired = value: go [ ] (stringToCharacters value);
}
