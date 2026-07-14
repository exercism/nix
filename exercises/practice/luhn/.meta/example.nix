let
  inherit (import <nixpkgs/lib>)
    replaceString
    toInt
    stringToCharacters
    mod
    imap1
    pipe
    reverseList
    ;
  allDigits = chars: builtins.all (c: builtins.match "[0-9]" c != null) chars;
  checksum =
    chars:
    let
      sum = pipe chars [
        (map toInt)
        reverseList
        (imap1 (i: n: if mod i 2 == 0 then 2 * n else n))
        (map (n: if n > 9 then n - 9 else n))
        (builtins.foldl' (acc: n: acc + n) 0)
      ];
    in
    mod sum 10 == 0;
in
{
  isValid =
    value:
    let
      stripped = stringToCharacters (replaceString " " "" value);
    in
    builtins.length stripped > 1 && allDigits stripped && checksum stripped;
}
