with builtins;
rec {
  keep =
    pred: list:
    if list == [ ] then
      [ ]
    else if pred (head list) then
      [ (head list) ] ++ keep pred (tail list)
    else
      keep pred (tail list);
  discard = pred: keep (x: !pred x);
}
