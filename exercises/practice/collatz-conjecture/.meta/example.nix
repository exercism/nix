let
  inherit (import <nixpkgs/lib>) throwIfNot mod;
  go =
    n: acc:
    if n == 1 then
      acc
    else if mod n 2 == 0 then
      go (n / 2) (acc + 1)
    else
      go (3 * n + 1) (acc + 1);
in
{
  steps = n: throwIfNot (n > 0) "Only positive integers are allowed" (go n 0);
}
