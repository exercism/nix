let
  inherit (import ./pig-latin.nix) translate;
in
{
  "test word beginning with a" = {
    expr = translate "apple";
    expected = "appleay";
  };

  "test word beginning with e" = {
    expr = translate "ear";
    expected = "earay";
  };

  "test word beginning with i" = {
    expr = translate "igloo";
    expected = "iglooay";
  };

  "test word beginning with o" = {
    expr = translate "object";
    expected = "objectay";
  };

  "test word beginning with u" = {
    expr = translate "under";
    expected = "underay";
  };

  "test word beginning with a vowel and followed by a qu" = {
    expr = translate "equal";
    expected = "equalay";
  };

  "test word beginning with p" = {
    expr = translate "pig";
    expected = "igpay";
  };

  "test word beginning with k" = {
    expr = translate "koala";
    expected = "oalakay";
  };

  "test word beginning with x" = {
    expr = translate "xenon";
    expected = "enonxay";
  };

  "test word beginning with q without a following u" = {
    expr = translate "qat";
    expected = "atqay";
  };

  "test word beginning with consonant and vowel containing qu" = {
    expr = translate "liquid";
    expected = "iquidlay";
  };

  "test word beginning with ch" = {
    expr = translate "chair";
    expected = "airchay";
  };

  "test word beginning with qu" = {
    expr = translate "queen";
    expected = "eenquay";
  };

  "test word beginning with qu and a preceding consonant" = {
    expr = translate "square";
    expected = "aresquay";
  };

  "test word beginning with th" = {
    expr = translate "therapy";
    expected = "erapythay";
  };

  "test word beginning with thr" = {
    expr = translate "thrush";
    expected = "ushthray";
  };

  "test word beginning with sch" = {
    expr = translate "school";
    expected = "oolschay";
  };

  "test word beginning with yt" = {
    expr = translate "yttria";
    expected = "yttriaay";
  };

  "test word beginning with xr" = {
    expr = translate "xray";
    expected = "xrayay";
  };

  "test y is treated like a consonant at the beginning of a word" = {
    expr = translate "yellow";
    expected = "ellowyay";
  };

  "test y is treated like a vowel at the end of a consonant cluster" = {
    expr = translate "rhythm";
    expected = "ythmrhay";
  };

  "test y as second letter in two letter word" = {
    expr = translate "my";
    expected = "ymay";
  };

  "test a whole phrase" = {
    expr = translate "quick fast run";
    expected = "ickquay astfay unray";
  };
}
