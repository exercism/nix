let
  inherit (import <nixpkgs/lib>)
    concatMapAttrs
    nameValuePair
    toLower
    toInt
    listToAttrs
    ;
in
{
  transform = concatMapAttrs (
    score: letters:
    let
      score' = toInt score;
      pairs = map (letter: nameValuePair (toLower letter) score') letters;
    in
    listToAttrs pairs
  );
}
