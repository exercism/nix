let
  isValid =
    a: b: c:
    a > 0 && b > 0 && c > 0 && a + b >= c && b + c >= a && a + c >= b;
in
{
  isEquilateral =
    sides:
    let
      a = builtins.elemAt sides 0;
      b = builtins.elemAt sides 1;
      c = builtins.elemAt sides 2;
    in
    isValid a b c && a == b && b == c;
  isScalene =
    sides:
    let
      a = builtins.elemAt sides 0;
      b = builtins.elemAt sides 1;
      c = builtins.elemAt sides 2;
    in
    isValid a b c && a != b && b != c && a != c;
  isIsosceles =
    sides:
    let
      a = builtins.elemAt sides 0;
      b = builtins.elemAt sides 1;
      c = builtins.elemAt sides 2;
    in
    isValid a b c && (a == b || b == c || a == c);
}
