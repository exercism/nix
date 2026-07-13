let
  inherit (import ./pascals-triangle.nix) rows;
in
{
  "test zero rows" = {
    expr = rows 0;
    expected = [ ];
  };

  "test single row" = {
    expr = rows 1;
    expected = [
      [ 1 ]
    ];
  };

  "test two rows" = {
    expr = rows 2;
    expected = [
      [ 1 ]
      [
        1
        1
      ]
    ];
  };

  "test three rows" = {
    expr = rows 3;
    expected = [
      [ 1 ]
      [
        1
        1
      ]
      [
        1
        2
        1
      ]
    ];
  };

  "test four rows" = {
    expr = rows 4;
    expected = [
      [ 1 ]
      [
        1
        1
      ]
      [
        1
        2
        1
      ]
      [
        1
        3
        3
        1
      ]
    ];
  };

  "test five rows" = {
    expr = rows 5;
    expected = [
      [ 1 ]
      [
        1
        1
      ]
      [
        1
        2
        1
      ]
      [
        1
        3
        3
        1
      ]
      [
        1
        4
        6
        4
        1
      ]
    ];
  };

  "test six rows" = {
    expr = rows 6;
    expected = [
      [ 1 ]
      [
        1
        1
      ]
      [
        1
        2
        1
      ]
      [
        1
        3
        3
        1
      ]
      [
        1
        4
        6
        4
        1
      ]
      [
        1
        5
        10
        10
        5
        1
      ]
    ];
  };

  "test ten rows" = {
    expr = rows 10;
    expected = [
      [ 1 ]
      [
        1
        1
      ]
      [
        1
        2
        1
      ]
      [
        1
        3
        3
        1
      ]
      [
        1
        4
        6
        4
        1
      ]
      [
        1
        5
        10
        10
        5
        1
      ]
      [
        1
        6
        15
        20
        15
        6
        1
      ]
      [
        1
        7
        21
        35
        35
        21
        7
        1
      ]
      [
        1
        8
        28
        56
        70
        56
        28
        8
        1
      ]
      [
        1
        9
        36
        84
        126
        126
        84
        36
        9
        1
      ]
    ];
  };
}
