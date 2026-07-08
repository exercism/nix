let
  inherit (import ./hello-world.nix) hello;
in
{
  "test hello" = {
    expr = hello { };
    expected = "Hello, World!";
  };
}
