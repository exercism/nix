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
in
{
  value =
    colors:
    let
      firstColor = builtins.elemAt colors 0;
      secondColor = builtins.elemAt colors 1;
    in
    10 * colorValues.${firstColor} + colorValues.${secondColor};
}
