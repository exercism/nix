let
  inherit (import ./eliuds-eggs.nix) eggCount;
in
{
  "test 0 eggs" = {
    expr = eggCount 0;
    expected = 0;
  };

  "test 1 egg" = {
    expr = eggCount 16;
    expected = 1;
  };

  "test 4 eggs" = {
    expr = eggCount 89;
    expected = 4;
  };

  "test 13 eggs" = {
    expr = eggCount 2000000000;
    expected = 13;
  };
}
