with builtins;
{
  slices =
    series: sliceLength:
    let
      seriesLength = stringLength series;
    in
    if seriesLength == 0 then
      throw "series cannot be empty"
    else if sliceLength > seriesLength then
      throw "slice length cannot be greater than series length"
    else if sliceLength == 0 then
      throw "slice length cannot be zero"
    else if sliceLength < 0 then
      throw "slice length cannot be negative"
    else
      genList (i: substring i sliceLength series) (seriesLength - sliceLength + 1);
}
