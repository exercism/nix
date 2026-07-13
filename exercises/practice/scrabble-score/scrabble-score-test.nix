let
  inherit (import ./scrabble-score.nix) score;
in
{
  "test lowercase letter" = {
    expr = score "a";
    expected = 1;
  };

  "test uppercase letter" = {
    expr = score "A";
    expected = 1;
  };

  "test valuable letter" = {
    expr = score "f";
    expected = 4;
  };

  "test short word" = {
    expr = score "at";
    expected = 2;
  };

  "test short, valuable word" = {
    expr = score "zoo";
    expected = 12;
  };

  "test medium word" = {
    expr = score "street";
    expected = 6;
  };

  "test medium, valuable word" = {
    expr = score "quirky";
    expected = 22;
  };

  "test long, mixed-case word" = {
    expr = score "OxyphenButazone";
    expected = 41;
  };

  "test english-like word" = {
    expr = score "pinata";
    expected = 8;
  };

  "test empty input" = {
    expr = score "";
    expected = 0;
  };

  "test entire alphabet available" = {
    expr = score "abcdefghijklmnopqrstuvwxyz";
    expected = 87;
  };
}
