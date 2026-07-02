let
  inherit (import ./triangle.nix) isEquilateral isScalene isIsosceles;
in
{
  "test all sides are equal" = {
    expr = isEquilateral [
      2
      2
      2
    ];
    expected = true;
  };

  "test any side is unequal" = {
    expr = isEquilateral [
      2
      3
      2
    ];
    expected = false;
  };

  "test no sides are equal" = {
    expr = isEquilateral [
      5
      4
      6
    ];
    expected = false;
  };

  "test all zero sides is not a triangle" = {
    expr = isEquilateral [
      0
      0
      0
    ];
    expected = false;
  };

  "test sides may be floats" = {
    expr = isEquilateral [
      0.5
      0.5
      0.5
    ];
    expected = true;
  };

  "test last two sides are equal" = {
    expr = isIsosceles [
      3
      4
      4
    ];
    expected = true;
  };

  "test first two sides are equal" = {
    expr = isIsosceles [
      4
      4
      3
    ];
    expected = true;
  };

  "test first and last sides are equal" = {
    expr = isIsosceles [
      4
      3
      4
    ];
    expected = true;
  };

  "test equilateral triangles are also isosceles" = {
    expr = isIsosceles [
      4
      4
      4
    ];
    expected = true;
  };

  "test no sides are equal isosceles" = {
    expr = isIsosceles [
      2
      3
      4
    ];
    expected = false;
  };

  "test first triangle inequality violation" = {
    expr = isIsosceles [
      1
      1
      3
    ];
    expected = false;
  };

  "test second triangle inequality violation" = {
    expr = isIsosceles [
      1
      3
      1
    ];
    expected = false;
  };

  "test third triangle inequality violation" = {
    expr = isIsosceles [
      3
      1
      1
    ];
    expected = false;
  };

  "test sides may be floats isosceles" = {
    expr = isIsosceles [
      0.5
      0.4
      0.5
    ];
    expected = true;
  };

  "test no sides are equal scalene" = {
    expr = isScalene [
      5
      4
      6
    ];
    expected = true;
  };

  "test all sides are equal scalene" = {
    expr = isScalene [
      4
      4
      4
    ];
    expected = false;
  };

  "test first and second sides are equal" = {
    expr = isScalene [
      4
      4
      3
    ];
    expected = false;
  };

  "test first and third sides are equal" = {
    expr = isScalene [
      3
      4
      3
    ];
    expected = false;
  };

  "test second and third sides are equal" = {
    expr = isScalene [
      4
      3
      3
    ];
    expected = false;
  };

  "test may not violate triangle inequality" = {
    expr = isScalene [
      7
      3
      2
    ];
    expected = false;
  };

  "test sides may be floats scalene" = {
    expr = isScalene [
      0.5
      0.4
      0.6
    ];
    expected = true;
  };
}
