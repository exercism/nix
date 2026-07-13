let
  inherit (import ./allergies.nix) isAllergicTo allergies;
  sortStrings = builtins.sort (p: q: p < q);
  items = [
    "eggs"
    "peanuts"
    "shellfish"
    "strawberries"
    "tomatoes"
    "chocolate"
    "pollen"
    "cats"
  ];
in
{
  "test not allergic to anything" = {
    expr = builtins.any (item: isAllergicTo item 0) items;
    expected = false;
  };

  "test allergic to everything" = {
    expr = builtins.all (item: isAllergicTo item 255) items;
    expected = true;
  };

  "test allergic only to eggs" = {
    expr = isAllergicTo "eggs" 1;
    expected = true;
  };

  "test allergic to eggs and something else" = {
    expr = isAllergicTo "eggs" 3;
    expected = true;
  };

  "test allergic to something, but not eggs" = {
    expr = isAllergicTo "eggs" 2;
    expected = false;
  };

  "test allergic only to peanuts" = {
    expr = isAllergicTo "peanuts" 2;
    expected = true;
  };

  "test allergic to peanuts and something else" = {
    expr = isAllergicTo "peanuts" 7;
    expected = true;
  };

  "test allergic to something, but not peanuts" = {
    expr = isAllergicTo "peanuts" 5;
    expected = false;
  };

  "test allergic only to shellfish" = {
    expr = isAllergicTo "shellfish" 4;
    expected = true;
  };

  "test allergic to shellfish and something else" = {
    expr = isAllergicTo "shellfish" 14;
    expected = true;
  };

  "test allergic to something, but not shellfish" = {
    expr = isAllergicTo "shellfish" 10;
    expected = false;
  };

  "test allergic only to strawberries" = {
    expr = isAllergicTo "strawberries" 8;
    expected = true;
  };

  "test allergic to strawberries and something else" = {
    expr = isAllergicTo "strawberries" 28;
    expected = true;
  };

  "test allergic to something, but not strawberries" = {
    expr = isAllergicTo "strawberries" 20;
    expected = false;
  };

  "test allergic only to tomatoes" = {
    expr = isAllergicTo "tomatoes" 16;
    expected = true;
  };

  "test allergic to tomatoes and something else" = {
    expr = isAllergicTo "tomatoes" 56;
    expected = true;
  };

  "test allergic to something, but not tomatoes" = {
    expr = isAllergicTo "tomatoes" 40;
    expected = false;
  };

  "test allergic only to chocolate" = {
    expr = isAllergicTo "chocolate" 32;
    expected = true;
  };

  "test allergic to chocolate and something else" = {
    expr = isAllergicTo "chocolate" 112;
    expected = true;
  };

  "test allergic to something, but not chocolate" = {
    expr = isAllergicTo "chocolate" 80;
    expected = false;
  };

  "test allergic only to pollen" = {
    expr = isAllergicTo "pollen" 64;
    expected = true;
  };

  "test allergic to pollen and something else" = {
    expr = isAllergicTo "pollen" 224;
    expected = true;
  };

  "test allergic to something, but not pollen" = {
    expr = isAllergicTo "pollen" 160;
    expected = false;
  };

  "test allergic only to cats" = {
    expr = isAllergicTo "cats" 128;
    expected = true;
  };

  "test allergic to cats and something else" = {
    expr = isAllergicTo "cats" 192;
    expected = true;
  };

  "test allergic to something, but not cats" = {
    expr = isAllergicTo "cats" 64;
    expected = false;
  };

  "test no allergies" = {
    expr = allergies 0;
    expected = [ ];
  };

  "test just eggs" = {
    expr = allergies 1;
    expected = [ "eggs" ];
  };

  "test just peanuts" = {
    expr = allergies 2;
    expected = [ "peanuts" ];
  };

  "test just strawberries" = {
    expr = allergies 8;
    expected = [ "strawberries" ];
  };

  "test eggs and peanuts" = {
    expr = sortStrings (allergies 3);
    expected = [
      "eggs"
      "peanuts"
    ];
  };

  "test more than eggs but not peanuts" = {
    expr = sortStrings (allergies 5);
    expected = [
      "eggs"
      "shellfish"
    ];
  };

  "test lots of stuff" = {
    expr = sortStrings (allergies 248);
    expected = sortStrings [
      "strawberries"
      "tomatoes"
      "chocolate"
      "pollen"
      "cats"
    ];
  };

  "test everything" = {
    expr = sortStrings (allergies 255);
    expected = sortStrings [
      "eggs"
      "peanuts"
      "shellfish"
      "strawberries"
      "tomatoes"
      "chocolate"
      "pollen"
      "cats"
    ];
  };

  "test no allergen score parts" = {
    expr = allergies 509;
    expected = sortStrings [
      "eggs"
      "shellfish"
      "strawberries"
      "tomatoes"
      "chocolate"
      "pollen"
      "cats"
    ];
  };

  "test no allergen score parts without highest valid score" = {
    expr = allergies 257;
    expected = [ "eggs" ];
  };
}
