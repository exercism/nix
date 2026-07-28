let
  inherit (import <nixpkgs/lib>)
    imap0
    pipe
    stringToCharacters
    mod
    replaceStrings
    toInt
    ;
in
{
  isValid =
    isbn:
    let
      sanitized = replaceStrings [ "-" ] [ "" ] isbn;
    in
    builtins.match "[0-9]{9}[0-9X]" sanitized != null
    && pipe sanitized [
      stringToCharacters
      (map (n: if n == "X" then 10 else toInt n))
      (imap0 (i: n: (10 - i) * n))
      (builtins.foldl' builtins.add 0)
      (sum: mod sum 11 == 0)
    ];
}
