let
  inherit (import <nixpkgs/lib>) reverseList;
  actions = [
    {
      bitmask = 1;
      name = "wink";
    }
    {
      bitmask = 2;
      name = "double blink";
    }
    {
      bitmask = 4;
      name = "close your eyes";
    }
    {
      bitmask = 8;
      name = "jump";
    }
  ];
in
{
  commands =
    number:
    let
      res = map (action: action.name) (
        builtins.filter (action: builtins.bitAnd number action.bitmask != 0) actions
      );
    in
    if builtins.bitAnd number 16 != 0 then reverseList res else res;
}
