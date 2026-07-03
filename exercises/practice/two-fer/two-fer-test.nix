let
  inherit (import ./two-fer.nix) twoFer;
in
{
  "test no name given" = {
    expr = twoFer null;
    expected = "One for you, one for me.";
  };

  "test a name given" = {
    expr = twoFer "Alice";
    expected = "One for Alice, one for me.";
  };

  "test another name given" = {
    expr = twoFer "Bob";
    expected = "One for Bob, one for me.";
  };
}
