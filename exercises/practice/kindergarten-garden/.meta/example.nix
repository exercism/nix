let
  inherit (import <nixpkgs/lib>) strings;
  plant = {
    R = "radishes";
    V = "violets";
    C = "clover";
    G = "grass";
  };

in
{
  plants =
    diagram: student:
    let
      index = (strings.charToInt (builtins.substring 0 1 student) - 65) * 2;
      rowLength = (builtins.stringLength diagram) / 2;
    in
    [
      plant.${builtins.substring index 1 diagram}
      plant.${builtins.substring (index + 1) 1 diagram}
      plant.${builtins.substring (index + rowLength + 1) 1 diagram} # add one for the newline
      plant.${builtins.substring (index + rowLength + 2) 1 diagram}
    ];
}
