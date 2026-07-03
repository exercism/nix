let
  inherit (import ./.meta/example.nix) colorCode colors;
in
{
  "test Black" = {
    expr = colorCode "black";
    expected = 0;
  };

  "test White" = {
    expr = colorCode "white";
    expected = 9;
  };

  "test Orange" = {
    expr = colorCode "orange";
    expected = 3;
  };

  "test Colors" = {
    expr = colors;
    expected = [
      "black"
      "brown"
      "red"
      "orange"
      "yellow"
      "green"
      "blue"
      "violet"
      "grey"
      "white"
    ];
  };
}
