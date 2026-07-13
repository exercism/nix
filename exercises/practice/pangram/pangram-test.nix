let
  inherit (import ./pangram.nix) isPangram;
in
{
  "test empty sentence" = {
    expr = isPangram "";
    expected = false;
  };

  "test perfect lower case" = {
    expr = isPangram "abcdefghijklmnopqrstuvwxyz";
    expected = true;
  };

  "test only lower case" = {
    expr = isPangram "the quick brown fox jumps over the lazy dog";
    expected = true;
  };

  "test missing the letter 'x'" = {
    expr = isPangram "a quick movement of the enemy will jeopardize five gunboats";
    expected = false;
  };

  "test missing the letter 'h'" = {
    expr = isPangram "five boxing wizards jump quickly at it";
    expected = false;
  };

  "test with underscores" = {
    expr = isPangram "the_quick_brown_fox_jumps_over_the_lazy_dog";
    expected = true;
  };

  "test with numbers" = {
    expr = isPangram "the 1 quick brown fox jumps over the 2 lazy dogs";
    expected = true;
  };

  "test missing letters replaced by numbers" = {
    expr = isPangram "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog";
    expected = false;
  };

  "test mixed case and punctuation" = {
    expr = isPangram "\"Five quacking Zephyrs jolt my wax bed.\"";
    expected = true;
  };

  "test a-m and A-M are 26 different characters but not a pangram" = {
    expr = isPangram "abcdefghijklm ABCDEFGHIJKLM";
    expected = false;
  };
}
