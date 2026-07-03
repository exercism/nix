let
  colorValues = {
    black = 0;
    brown = 1;
    red = 2;
    orange = 3;
    yellow = 4;
    green = 5;
    blue = 6;
    violet = 7;
    grey = 8;
    white = 9;
  };
  pow10 = expt: if expt == 0 then 1 else 10 * pow10 (expt - 1);
in
{
  label =
    colors:
    let
      a = colorValues.${builtins.elemAt colors 0};
      b = colorValues.${builtins.elemAt colors 1};
      c = colorValues.${builtins.elemAt colors 2};
      res = (10 * a + b) * pow10 c;
    in
    if res >= 1000000000 then
      {
        value = res / 1000000000;
        unit = "gigaohms";
      }
    else if res >= 1000000 then
      {
        value = res / 1000000;
        unit = "megaohms";
      }
    else if res >= 1000 then
      {
        value = res / 1000;
        unit = "kiloohms";
      }
    else
      {
        value = res;
        unit = "ohms";
      };
}
