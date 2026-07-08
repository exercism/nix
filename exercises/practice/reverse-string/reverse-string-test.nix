with builtins;
let
  lib = import <nixpkgs/lib>;
  exercise = import ./reverse-string.nix;
  results = lib.debug.runTests {
    testAnEmptyString = {
      expr = exercise.reverse "";
      expected = "";
    };
    testAWord = {
      expr = exercise.reverse "robot";
      expected = "tobor";
    };
    testACapitalizedWord = {
      expr = exercise.reverse "Ramen";
      expected = "nemaR";
    };
    testASentenceWithPunctuation = {
      expr = exercise.reverse "I'm hungry!";
      expected = "!yrgnuh m'I";
    };
    testAPalindrome = {
      expr = exercise.reverse "racecar";
      expected = "racecar";
    };
    testAnEvenSizedWord = {
      expr = exercise.reverse "drawer";
      expected = "reward";
    };
  };
in
if results == [ ] then
  "All tests passed!\n"
else
  deepSeq (map (
    t:
    trace ''
      ${t.name}:
        expected: ${t.expected}
        result: ${t.result}'' t
  ) results) (throw "${toString (length results)} tests failed!\n")
