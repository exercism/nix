let
  inherit (import ./raindrops.nix) convert;
in
{
  "test the sound for 1 is 1" = {
    expr = convert 1;
    expected = "1";
  };

  "test the sound for 3 is Pling" = {
    expr = convert 3;
    expected = "Pling";
  };

  "test the sound for 5 is Plang" = {
    expr = convert 5;
    expected = "Plang";
  };

  "test the sound for 7 is Plong" = {
    expr = convert 7;
    expected = "Plong";
  };

  "test the sound for 6 is Pling as it has a factor 3" = {
    expr = convert 6;
    expected = "Pling";
  };

  "test 2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base" = {
    expr = convert 8;
    expected = "8";
  };

  "test the sound for 9 is Pling as it has a factor 3" = {
    expr = convert 9;
    expected = "Pling";
  };

  "test the sound for 10 is Plang as it has a factor 5" = {
    expr = convert 10;
    expected = "Plang";
  };

  "test the sound for 14 is Plong as it has a factor of 7" = {
    expr = convert 14;
    expected = "Plong";
  };

  "test the sound for 15 is PlingPlang as it has factors 3 and 5" = {
    expr = convert 15;
    expected = "PlingPlang";
  };

  "test the sound for 21 is PlingPlong as it has factors 3 and 7" = {
    expr = convert 21;
    expected = "PlingPlong";
  };

  "test the sound for 25 is Plang as it has a factor 5" = {
    expr = convert 25;
    expected = "Plang";
  };

  "test the sound for 27 is Pling as it has a factor 3" = {
    expr = convert 27;
    expected = "Pling";
  };

  "test the sound for 35 is PlangPlong as it has factors 5 and 7" = {
    expr = convert 35;
    expected = "PlangPlong";
  };

  "test the sound for 49 is Plong as it has a factor 7" = {
    expr = convert 49;
    expected = "Plong";
  };

  "test the sound for 52 is 52" = {
    expr = convert 52;
    expected = "52";
  };

  "test the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7" = {
    expr = convert 105;
    expected = "PlingPlangPlong";
  };

  "test the sound for 3125 is Plang as it has a factor 5" = {
    expr = convert 3125;
    expected = "Plang";
  };
}
