let
  eggCount = number: if number == 0 then 0 else builtins.bitAnd number 1 + eggCount (number / 2);
in
{
  inherit eggCount;
}
