let
  inherit (import ./anagram.nix) findAnagrams;
in
{
  "test no matches" = {
    expr = findAnagrams "diaper" [
      "hello"
      "world"
      "zombies"
      "pants"
    ];
    expected = [ ];
  };

  "test detects two anagrams" = {
    expr = findAnagrams "solemn" [
      "lemons"
      "cherry"
      "melons"
    ];
    expected = [
      "lemons"
      "melons"
    ];
  };

  "test does not detect anagram subsets" = {
    expr = findAnagrams "good" [
      "dog"
      "goody"
    ];
    expected = [ ];
  };

  "test detects anagram" = {
    expr = findAnagrams "listen" [
      "enlists"
      "google"
      "inlets"
      "banana"
    ];
    expected = [ "inlets" ];
  };

  "test detects three anagrams" = {
    expr = findAnagrams "allergy" [
      "gallery"
      "ballerina"
      "regally"
      "clergy"
      "largely"
      "leading"
    ];
    expected = [
      "gallery"
      "regally"
      "largely"
    ];
  };

  "test detects multiple anagrams with different case" = {
    expr = findAnagrams "nose" [
      "Eons"
      "ONES"
    ];
    expected = [
      "Eons"
      "ONES"
    ];
  };

  "test does not detect non-anagrams with identical checksum" = {
    expr = findAnagrams "mass" [ "last" ];
    expected = [ ];
  };

  "test detects anagrams case-insensitively" = {
    expr = findAnagrams "Orchestra" [
      "cashregister"
      "Carthorse"
      "radishes"
    ];
    expected = [ "Carthorse" ];
  };

  "test detects anagrams using case-insensitive subject" = {
    expr = findAnagrams "Orchestra" [
      "cashregister"
      "carthorse"
      "radishes"
    ];
    expected = [ "carthorse" ];
  };

  "test detects anagrams using case-insensitive possible matches" = {
    expr = findAnagrams "orchestra" [
      "cashregister"
      "Carthorse"
      "radishes"
    ];
    expected = [ "Carthorse" ];
  };

  "test does not detect an anagram if the original word is repeated" = {
    expr = findAnagrams "go" [ "goGoGO" ];
    expected = [ ];
  };

  "test anagrams must use all letters exactly once" = {
    expr = findAnagrams "tapper" [ "patter" ];
    expected = [ ];
  };

  "test words are not anagrams of themselves" = {
    expr = findAnagrams "BANANA" [ "BANANA" ];
    expected = [ ];
  };

  "test words are not anagrams of themselves even if letter case is partially different" = {
    expr = findAnagrams "BANANA" [ "Banana" ];
    expected = [ ];
  };

  "test words are not anagrams of themselves even if letter case is completely different" = {
    expr = findAnagrams "BANANA" [ "banana" ];
    expected = [ ];
  };

  "test words other than themselves can be anagrams" = {
    expr = findAnagrams "LISTEN" [
      "LISTEN"
      "Silent"
    ];
    expected = [ "Silent" ];
  };
}
