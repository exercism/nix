{
  find =
    array: value:
    let
      len = builtins.length array;
      go =
        lo: hi:
        if lo > hi then
          null
        else
          let
            mid = (lo + hi) / 2;
            midVal = builtins.elemAt array mid;
          in
          if midVal == value then
            mid
          else if midVal < value then
            go (mid + 1) hi
          else
            go lo (mid - 1);
    in
    go 0 (len - 1);
}
