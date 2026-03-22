with builtins; let
  lib = import <nixpkgs/lib>;
  exercise = import ./booleans.nix;
  results = lib.debug.runTests {
    testYearNotDivisibleBy4 = {
      expr = exercise.leapYear 2015;
      expected = false;
    };
    testYearDivisibleBy2NotBy4 = {
      expr = exercise.leapYear 1970;
      expected = false;
    };
    testYearDivisibleBy4NotBy100 = {
      expr = exercise.leapYear 1996;
      expected = true;
    };
    testYearDivisibleBy4And5 = {
      expr = exercise.leapYear 1960;
      expected = true;
    };
    testYearDivisibleBy100NotBy400 = {
      expr = exercise.leapYear 2100;
      expected = false;
    };
    testYearDivisibleBy100NotBy3 = {
      expr = exercise.leapYear 1900;
      expected = false;
    };
    testYearDivisibleBy400 = {
      expr = exercise.leapYear 2000;
      expected = true;
    };
    testYearDivisibleBy400NotBy125 = {
      expr = exercise.leapYear 2400;
      expected = true;
    };
    testYearDivisibleBy200NotBy400 = {
      expr = exercise.leapYear 1800;
      expected = false;
    };
  };
in
  if results == []
  then "All tests passed!\n"
  else
    deepSeq
    (map
      (t:
        trace ''
          ${t.name}:
            expected: ${toJSON t.expected}
            result: ${toJSON t.result}''
        t)
      results)
    (throw "${toString (length results)} tests failed!\n")
