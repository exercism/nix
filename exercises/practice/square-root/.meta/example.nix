let
  inherit (import <nixpkgs/lib>) range findFirst;
in
{
  squareRoot = number: findFirst (n: n * n == number) null (range 1 number);
}
