let
  inherit (import <nixpkgs/lib>)
    removePrefix
    removeSuffix
    splitStringBy
    mapAttrs
    toLower
    pipe
    id
    ;
in
{
  countWords =
    sentence:
    pipe sentence [
      toLower
      (splitStringBy (_: curr: builtins.match "[a-z0-9']" curr == null) false)
      (map (word: removeSuffix "'" (removePrefix "'" word)))
      (builtins.filter (word: builtins.stringLength word > 0))
      (builtins.groupBy id)
      (mapAttrs (_: builtins.length))
    ];
}
