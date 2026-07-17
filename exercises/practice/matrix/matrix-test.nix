let
  inherit (import ./matrix.nix) row column;
in
{
  "test extract row from one number matrix" = {
    expr = row "1" 1;
    expected = [ 1 ];
  };

  "test can extract row" = {
    expr = row "1 2\n3 4" 2;
    expected = [
      3
      4
    ];
  };

  "test extract row where numbers have different widths" = {
    expr = row "1 2\n10 20" 2;
    expected = [
      10
      20
    ];
  };

  "test can extract row from non-square matrix with no corresponding column" = {
    expr = row "1 2 3\n4 5 6\n7 8 9\n8 7 6" 4;
    expected = [
      8
      7
      6
    ];
  };

  "test extract column from one number matrix" = {
    expr = column "1" 1;
    expected = [ 1 ];
  };

  "test can extract column" = {
    expr = column "1 2 3\n4 5 6\n7 8 9" 3;
    expected = [
      3
      6
      9
    ];
  };

  "test can extract column from non-square matrix with no corresponding row" = {
    expr = column "1 2 3 4\n5 6 7 8\n9 8 7 6" 4;
    expected = [
      4
      8
      6
    ];
  };

  "test extract column where numbers have different widths" = {
    expr = column "89 1903 3\n18 3 1\n9 4 800" 2;
    expected = [
      1903
      3
      4
    ];
  };
}
