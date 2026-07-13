let
  inherit (import ./matching-brackets.nix) isPaired;
in
{
  "test paired square brackets" = {
    expr = isPaired "[]";
    expected = true;
  };

  "test empty string" = {
    expr = isPaired "";
    expected = true;
  };

  "test unpaired brackets" = {
    expr = isPaired "[[";
    expected = false;
  };

  "test wrong ordered brackets" = {
    expr = isPaired "}{";
    expected = false;
  };

  "test wrong closing bracket" = {
    expr = isPaired "{]";
    expected = false;
  };

  "test paired with whitespace" = {
    expr = isPaired "{ }";
    expected = true;
  };

  "test partially paired brackets" = {
    expr = isPaired "{[])";
    expected = false;
  };

  "test simple nested brackets" = {
    expr = isPaired "{[]}";
    expected = true;
  };

  "test several paired brackets" = {
    expr = isPaired "{}[]";
    expected = true;
  };

  "test paired and nested brackets" = {
    expr = isPaired "([{}({}[])])";
    expected = true;
  };

  "test unopened closing brackets" = {
    expr = isPaired "{[)][]}";
    expected = false;
  };

  "test unpaired and nested brackets" = {
    expr = isPaired "([{])";
    expected = false;
  };

  "test paired and wrong nested brackets" = {
    expr = isPaired "[({]})";
    expected = false;
  };

  "test paired and wrong nested brackets but innermost are correct" = {
    expr = isPaired "[({}])";
    expected = false;
  };

  "test paired and incomplete brackets" = {
    expr = isPaired "{}[";
    expected = false;
  };

  "test too many closing brackets" = {
    expr = isPaired "[]]";
    expected = false;
  };

  "test early unexpected brackets" = {
    expr = isPaired ")()";
    expected = false;
  };

  "test early mismatched brackets" = {
    expr = isPaired "{)()";
    expected = false;
  };

  "test math expression" = {
    expr = isPaired "(((185 + 223.85) * 15) - 543)/2";
    expected = true;
  };

  "test complex latex expression" = {
    expr = isPaired "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)";
    expected = true;
  };
}
