let
  inherit (import <nixpkgs/lib>) mod hasPrefix elem;
  inherit (import ./strain.nix) discard keep;
in
{
  "test keep on empty list returns empty list" = {
    expr = keep (_: true) [ ];
    expected = [ ];
  };

  "test keeps everything" = {
    expr = keep (_: true) [
      1
      3
      5
    ];
    expected = [
      1
      3
      5
    ];
  };

  "test keeps nothing" = {
    expr = keep (_: false) [
      1
      3
      5
    ];
    expected = [ ];
  };

  "test keeps first and last" = {
    expr = keep (x: mod x 2 == 1) [
      1
      2
      3
    ];
    expected = [
      1
      3
    ];
  };

  "test keeps neither first nor last" = {
    expr = keep (x: mod x 2 == 0) [
      1
      2
      3
    ];
    expected = [ 2 ];
  };

  "test keeps strings" = {
    expr = keep (x: hasPrefix "z" x) [
      "apple"
      "zebra"
      "banana"
      "zombies"
      "cherimoya"
      "zealot"
    ];
    expected = [
      "zebra"
      "zombies"
      "zealot"
    ];
  };

  "test keeps lists" = {
    expr = keep (x: elem 5 x) [
      [
        1
        2
        3
      ]
      [
        5
        5
        5
      ]
      [
        5
        1
        2
      ]
      [
        2
        1
        2
      ]
      [
        1
        5
        2
      ]
      [
        2
        2
        1
      ]
      [
        1
        2
        5
      ]
    ];
    expected = [
      [
        5
        5
        5
      ]
      [
        5
        1
        2
      ]
      [
        1
        5
        2
      ]
      [
        1
        2
        5
      ]
    ];
  };

  "test discard on empty list returns empty list" = {
    expr = discard (_: true) [ ];
    expected = [ ];
  };

  "test discards everything" = {
    expr = discard (_: true) [
      1
      3
      5
    ];
    expected = [ ];
  };

  "test discards nothing" = {
    expr = discard (_: false) [
      1
      3
      5
    ];
    expected = [
      1
      3
      5
    ];
  };

  "test discards first and last" = {
    expr = discard (x: mod x 2 == 1) [
      1
      2
      3
    ];
    expected = [ 2 ];
  };

  "test discards neither first nor last" = {
    expr = discard (x: mod x 2 == 0) [
      1
      2
      3
    ];
    expected = [
      1
      3
    ];
  };

  "test discards strings" = {
    expr = discard (x: hasPrefix "z" x) [
      "apple"
      "zebra"
      "banana"
      "zombies"
      "cherimoya"
      "zealot"
    ];
    expected = [
      "apple"
      "banana"
      "cherimoya"
    ];
  };

  "test discards lists" = {
    expr = discard (x: elem 5 x) [
      [
        1
        2
        3
      ]
      [
        5
        5
        5
      ]
      [
        5
        1
        2
      ]
      [
        2
        1
        2
      ]
      [
        1
        5
        2
      ]
      [
        2
        2
        1
      ]
      [
        1
        2
        5
      ]
    ];
    expected = [
      [
        1
        2
        3
      ]
      [
        2
        1
        2
      ]
      [
        2
        2
        1
      ]
    ];
  };
}
