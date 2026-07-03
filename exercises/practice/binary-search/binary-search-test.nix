let
  inherit (import ./binary-search.nix) find;
in
{
  "test finds a value in an array with one element" = {
    expr = find [ 6 ] 6;
    expected = 0;
  };

  "test finds a value in the middle of an array" = {
    expr = find [
      1
      3
      4
      6
      8
      9
      11
    ] 6;
    expected = 3;
  };

  "test finds a value at the beginning of an array" = {
    expr = find [
      1
      3
      4
      6
      8
      9
      11
    ] 1;
    expected = 0;
  };

  "test finds a value at the end of an array" = {
    expr = find [
      1
      3
      4
      6
      8
      9
      11
    ] 11;
    expected = 6;
  };

  "test finds a value in an array of odd length" = {
    expr = find [
      1
      3
      5
      8
      13
      21
      34
      55
      89
      144
      233
      377
      634
    ] 144;
    expected = 9;
  };

  "test finds a value in an array of even length" = {
    expr = find [
      1
      3
      5
      8
      13
      21
      34
      55
      89
      144
      233
      377
    ] 21;
    expected = 5;
  };

  "test identifies that a value is not included in the array" = {
    expr = find [
      1
      3
      4
      6
      8
      9
      11
    ] 7;
    expected = null;
  };

  "test a value smaller than the array's smallest value is not found" = {
    expr = find [
      1
      3
      4
      6
      8
      9
      11
    ] 0;
    expected = null;
  };

  "test a value larger than the array's largest value is not found" = {
    expr = find [
      1
      3
      4
      6
      8
      9
      11
    ] 13;
    expected = null;
  };

  "test nothing is found in an empty array" = {
    expr = find [ ] 1;
    expected = null;
  };

  "test nothing is found when the left and right bounds cross" = {
    expr = find [ 1 2 ] 0;
    expected = null;
  };
}
