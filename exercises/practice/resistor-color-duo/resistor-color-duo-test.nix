let
  inherit (import ./resistor-color-duo.nix) value;
in
{
  "test Brown and black" = {
    expr = value [
      "brown"
      "black"
    ];
    expected = 10;
  };

  "test Blue and grey" = {
    expr = value [
      "blue"
      "grey"
    ];
    expected = 68;
  };

  "test Yellow and violet" = {
    expr = value [
      "yellow"
      "violet"
    ];
    expected = 47;
  };

  "test White and red" = {
    expr = value [
      "white"
      "red"
    ];
    expected = 92;
  };

  "test Orange and orange" = {
    expr = value [
      "orange"
      "orange"
    ];
    expected = 33;
  };

  "test Ignore additional colors" = {
    expr = value [
      "green"
      "brown"
      "orange"
    ];
    expected = 51;
  };

  "test Black and brown, one-digit" = {
    expr = value [
      "black"
      "brown"
    ];
    expected = 1;
  };
}
