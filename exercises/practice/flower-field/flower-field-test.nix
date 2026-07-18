let
  inherit (import ./flower-field.nix) annotate;
in
{
  "test no rows" = {
    expr = annotate [ ];
    expected = [ ];
  };

  "test no columns" = {
    expr = annotate [ "" ];
    expected = [ "" ];
  };

  "test no flowers" = {
    expr = annotate [
      "   "
      "   "
      "   "
    ];
    expected = [
      "   "
      "   "
      "   "
    ];
  };

  "test garden full of flowers" = {
    expr = annotate [
      "***"
      "***"
      "***"
    ];
    expected = [
      "***"
      "***"
      "***"
    ];
  };

  "test flower surrounded by spaces" = {
    expr = annotate [
      "   "
      " * "
      "   "
    ];
    expected = [
      "111"
      "1*1"
      "111"
    ];
  };

  "test space surrounded by flowers" = {
    expr = annotate [
      "***"
      "* *"
      "***"
    ];
    expected = [
      "***"
      "*8*"
      "***"
    ];
  };

  "test horizontal line" = {
    expr = annotate [
      " * * "
    ];
    expected = [
      "1*2*1"
    ];
  };

  "test horizontal line, flowers at edges" = {
    expr = annotate [
      "*   *"
    ];
    expected = [
      "*1 1*"
    ];
  };

  "test vertical line" = {
    expr = annotate [
      " "
      "*"
      " "
      "*"
      " "
    ];
    expected = [
      "1"
      "*"
      "2"
      "*"
      "1"
    ];
  };

  "test vertical line, flowers at edges" = {
    expr = annotate [
      "*"
      " "
      " "
      " "
      "*"
    ];
    expected = [
      "*"
      "1"
      " "
      "1"
      "*"
    ];
  };

  "test cross" = {
    expr = annotate [
      "  *  "
      "  *  "
      "*****"
      "  *  "
      "  *  "
    ];
    expected = [
      " 2*2 "
      "25*52"
      "*****"
      "25*52"
      " 2*2 "
    ];
  };

  "test large garden" = {
    expr = annotate [
      " *  * "
      "  *   "
      "    * "
      "   * *"
      " *  * "
      "      "
    ];
    expected = [
      "1*22*1"
      "12*322"
      " 123*2"
      "112*4*"
      "1*22*2"
      "111111"
    ];
  };

  "test multiple adjacent flowers" = {
    expr = annotate [
      " ** "
    ];
    expected = [
      "1**1"
    ];
  };
}
