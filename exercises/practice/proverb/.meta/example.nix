let
  inherit (import <nixpkgs/lib>) zipListsWith concatLines;
  verse = a: b: "For want of a ${a} the ${b} was lost.";
in
{
  recite =
    strings:
    if strings == [ ] then
      ""
    else
      let
        lines = zipListsWith verse strings (builtins.tail strings);
        finalLine = "And all for the want of a ${builtins.head strings}.";
      in
      concatLines (lines ++ [ finalLine ]);
}
