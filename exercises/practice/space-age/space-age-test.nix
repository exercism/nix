let
  inherit (import ./space-age.nix) age;
  abs = val: if val < 0 then -val else val;
  inDelta = actual: expected: abs (actual - expected) < 0.005;
in
{
  "test age on Earth" = {
    expr = inDelta (age "Earth" 1000000000) 31.69;
    expected = true;
  };
  "test age on Mercury" = {
    expr = inDelta (age "Mercury" 2134835688) 280.88;
    expected = true;
  };
  "test age on Venus" = {
    expr = inDelta (age "Venus" 189839836) 9.78;
    expected = true;
  };
  "test age on Mars" = {
    expr = inDelta (age "Mars" 2129871239) 35.88;
    expected = true;
  };
  "test age on Jupiter" = {
    expr = inDelta (age "Jupiter" 901876382) 2.41;
    expected = true;
  };
  "test age on Saturn" = {
    expr = inDelta (age "Saturn" 2000000000) 2.15;
    expected = true;
  };
  "test age on Uranus" = {
    expr = inDelta (age "Uranus" 1210123456) 0.46;
    expected = true;
  };
  "test age on Neptune" = {
    expr = inDelta (age "Neptune" 1821023456) 0.35;
    expected = true;
  };
  "test invalid planet causes error" = {
    expr = age "Sun" 680804807;
    expectedError.type = "ThrownError";
    expectedError.msg = "not a planet";
  };
}
