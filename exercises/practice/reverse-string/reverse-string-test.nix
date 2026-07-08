let
  inherit (import ./reverse-string.nix) reverse;
in
{
  "test an empty string" = {
    expr = reverse "";
    expected = "";
  };

  "test a word" = {
    expr = reverse "robot";
    expected = "tobor";
  };

  "test a capitalized word" = {
    expr = reverse "Ramen";
    expected = "nemaR";
  };

  "test a sentence with punctuation" = {
    expr = reverse "I'm hungry!";
    expected = "!yrgnuh m'I";
  };

  "test a palindrome" = {
    expr = reverse "racecar";
    expected = "racecar";
  };

  "test an even sized word" = {
    expr = reverse "drawer";
    expected = "reward";
  };
}
