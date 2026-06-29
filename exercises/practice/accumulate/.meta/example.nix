let
  inherit (builtins) head tail;
  accumulate =
    list: accumulator:
    if list == [ ] then [ ] else [ (accumulator (head list)) ] ++ accumulate (tail list) accumulator;
in
{
  inherit accumulate;
}
