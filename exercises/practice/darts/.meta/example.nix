{
  score =
    x: y:
    let
      distanceSquared = x * x + y * y;
    in
    if distanceSquared > 100 then
      0
    else if distanceSquared > 25 then
      1
    else if distanceSquared > 1 then
      5
    else
      10;
}
