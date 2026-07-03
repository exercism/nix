let
  inherit (import ./secret-handshake.nix) commands;
in
{
  "test wink for 1" = {
    expr = commands 1;
    expected = [ "wink" ];
  };

  "test double blink for 10" = {
    expr = commands 2;
    expected = [ "double blink" ];
  };

  "test close your eyes for 100" = {
    expr = commands 4;
    expected = [ "close your eyes" ];
  };

  "test jump for 1000" = {
    expr = commands 8;
    expected = [ "jump" ];
  };

  "test combine two actions" = {
    expr = commands 3;
    expected = [
      "wink"
      "double blink"
    ];
  };

  "test reverse two actions" = {
    expr = commands 19;
    expected = [
      "double blink"
      "wink"
    ];
  };

  "test reversing one action gives the same action" = {
    expr = commands 24;
    expected = [ "jump" ];
  };

  "test reversing no actions still gives no actions" = {
    expr = commands 16;
    expected = [ ];
  };

  "test all possible actions" = {
    expr = commands 15;
    expected = [
      "wink"
      "double blink"
      "close your eyes"
      "jump"
    ];
  };

  "test reverse all possible actions" = {
    expr = commands 31;
    expected = [
      "jump"
      "close your eyes"
      "double blink"
      "wink"
    ];
  };

  "test do nothing for zero" = {
    expr = commands 0;
    expected = [ ];
  };
}
