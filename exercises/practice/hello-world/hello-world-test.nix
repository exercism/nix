with builtins; let
  lib = import <nixpkgs/lib>;
  helloWorld = import ./hello-world.nix;
  results = lib.debug.runTests {
    testHello = {
      expr = helloWorld.hello {};
      expected = "Hello, World!";
    };
  };
in
  if results == []
  then "All tests passed!\n"
  else
    deepSeq
    (map
      (t:
        trace ''
          ${t.name}:
            expected: ${t.expected}
            result: ${t.result}''
        t)
      results)
    (throw "${toString (length results)} tests failed!\n")
