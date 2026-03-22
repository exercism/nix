{
  leapYear = year:
    let
      mod = a: b: a - (b * (a / b));
    in
      if mod year 400 == 0 then true
      else if mod year 100 == 0 then false
      else if mod year 4 == 0 then true
      else false;
}
