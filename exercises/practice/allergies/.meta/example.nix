let
  inherit (import <nixpkgs/lib>) attrNames;
  items = {
    "eggs" = 1;
    "peanuts" = 2;
    "shellfish" = 4;
    "strawberries" = 8;
    "tomatoes" = 16;
    "chocolate" = 32;
    "pollen" = 64;
    "cats" = 128;
  };
in
rec {
  isAllergicTo = item: score: builtins.bitAnd items.${item} score != 0;
  allergies = score: builtins.filter (item: isAllergicTo item score) (attrNames items);
}
