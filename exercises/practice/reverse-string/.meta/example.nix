{
  reverse = str:
    let
      len = builtins.stringLength str;
      chars = builtins.genList (i: builtins.substring i 1 str) len;
      reversed = builtins.genList (i: builtins.elemAt chars (len - 1 - i)) len;
    in
      builtins.concatStringsSep "" reversed;
}
