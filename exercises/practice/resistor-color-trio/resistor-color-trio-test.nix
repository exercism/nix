let
  inherit (import ./resistor-color-trio.nix) label;
in
{
  "test orange and orange and black" = {
    expr = label [
      "orange"
      "orange"
      "black"
    ];
    expected = {
      value = 33;
      unit = "ohms";
    };
  };

  "test blue and grey and brown" = {
    expr = label [
      "blue"
      "grey"
      "brown"
    ];
    expected = {
      value = 680;
      unit = "ohms";
    };
  };

  "test red and black and red" = {
    expr = label [
      "red"
      "black"
      "red"
    ];
    expected = {
      value = 2;
      unit = "kiloohms";
    };
  };

  "test green and brown and orange" = {
    expr = label [
      "green"
      "brown"
      "orange"
    ];
    expected = {
      value = 51;
      unit = "kiloohms";
    };
  };

  "test yellow and violet and yellow" = {
    expr = label [
      "yellow"
      "violet"
      "yellow"
    ];
    expected = {
      value = 470;
      unit = "kiloohms";
    };
  };

  "test blue and violet and blue" = {
    expr = label [
      "blue"
      "violet"
      "blue"
    ];
    expected = {
      value = 67;
      unit = "megaohms";
    };
  };

  "test minimum possible value" = {
    expr = label [
      "black"
      "black"
      "black"
    ];
    expected = {
      value = 0;
      unit = "ohms";
    };
  };

  "test maximum possible value" = {
    expr = label [
      "white"
      "white"
      "white"
    ];
    expected = {
      value = 99;
      unit = "gigaohms";
    };
  };

  "test first two colors make an invalid octal number" = {
    expr = label [
      "black"
      "grey"
      "black"
    ];
    expected = {
      value = 8;
      unit = "ohms";
    };
  };

  "test ignore extra colors" = {
    expr = label [
      "blue"
      "green"
      "yellow"
      "orange"
    ];
    expected = {
      value = 650;
      unit = "kiloohms";
    };
  };
}
