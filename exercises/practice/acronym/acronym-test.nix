let
  inherit (import ./acronym.nix) abbreviate;
in
{
  "test basic" = {
    expr = abbreviate "Portable Network Graphics";
    expected = "PNG";
  };

  "test lowercase words" = {
    expr = abbreviate "Ruby on Rails";
    expected = "ROR";
  };

  "test punctuation" = {
    expr = abbreviate "First In, First Out";
    expected = "FIFO";
  };

  "test all caps word" = {
    expr = abbreviate "GNU Image Manipulation Program";
    expected = "GIMP";
  };

  "test punctuation without whitespace" = {
    expr = abbreviate "Complementary metal-oxide semiconductor";
    expected = "CMOS";
  };

  "test very long abbreviation" = {
    expr = abbreviate "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me";
    expected = "ROTFLSHTMDCOALM";
  };

  "test consecutive delimiters" = {
    expr = abbreviate "Something - I made up from thin air";
    expected = "SIMUFTA";
  };

  "test apostrophes" = {
    expr = abbreviate "Halley's Comet";
    expected = "HC";
  };

  "test underscore emphasis" = {
    expr = abbreviate "The Road _Not_ Taken";
    expected = "TRNT";
  };
}
