let
  inherit (import <nixpkgs/lib>)
    stringToCharacters
    toInt
    pipe
    sublist
    length
    genList
    ;
  maximum = builtins.foldl' (a: b: if b > a then b else a) 0;
  product = builtins.foldl' (a: b: a * b) 1;
  chunksOf = size: list: genList (i: sublist i size list) (length list - size + 1);
in
{
  largestProduct =
    digits: span:
    if builtins.match "[0-9]*" digits == null then
      throw "digits input must only contain digits"
    else if builtins.stringLength digits < span then
      throw "span must not exceed string length"
    else if span < 0 then
      throw "span must not be negative"
    else
      pipe digits [
        stringToCharacters
        (map toInt)
        (chunksOf span)
        (map product)
        maximum
      ];
}
