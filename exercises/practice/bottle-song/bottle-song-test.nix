let
  inherit (import ./bottle-song.nix) recite;
in
{
  "test first generic verse" = {
    expr = recite 10 1;
    expected = ''
      Ten green bottles hanging on the wall,
      Ten green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be nine green bottles hanging on the wall.
    '';
  };

  "test last generic verse" = {
    expr = recite 3 1;
    expected = ''
      Three green bottles hanging on the wall,
      Three green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be two green bottles hanging on the wall.
    '';
  };

  "test verse with 2 bottles" = {
    expr = recite 2 1;
    expected = ''
      Two green bottles hanging on the wall,
      Two green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be one green bottle hanging on the wall.
    '';
  };

  "test verse with 1 bottle" = {
    expr = recite 1 1;
    expected = ''
      One green bottle hanging on the wall,
      One green bottle hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be no green bottles hanging on the wall.
    '';
  };

  "test first two verses" = {
    expr = recite 10 2;
    expected = ''
      Ten green bottles hanging on the wall,
      Ten green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be nine green bottles hanging on the wall.

      Nine green bottles hanging on the wall,
      Nine green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be eight green bottles hanging on the wall.
    '';
  };

  "test last three verses" = {
    expr = recite 3 3;
    expected = ''
      Three green bottles hanging on the wall,
      Three green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be two green bottles hanging on the wall.

      Two green bottles hanging on the wall,
      Two green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be one green bottle hanging on the wall.

      One green bottle hanging on the wall,
      One green bottle hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be no green bottles hanging on the wall.
    '';
  };

  "test all verses" = {
    expr = recite 10 10;
    expected = ''
      Ten green bottles hanging on the wall,
      Ten green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be nine green bottles hanging on the wall.

      Nine green bottles hanging on the wall,
      Nine green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be eight green bottles hanging on the wall.

      Eight green bottles hanging on the wall,
      Eight green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be seven green bottles hanging on the wall.

      Seven green bottles hanging on the wall,
      Seven green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be six green bottles hanging on the wall.

      Six green bottles hanging on the wall,
      Six green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be five green bottles hanging on the wall.

      Five green bottles hanging on the wall,
      Five green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be four green bottles hanging on the wall.

      Four green bottles hanging on the wall,
      Four green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be three green bottles hanging on the wall.

      Three green bottles hanging on the wall,
      Three green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be two green bottles hanging on the wall.

      Two green bottles hanging on the wall,
      Two green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be one green bottle hanging on the wall.

      One green bottle hanging on the wall,
      One green bottle hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be no green bottles hanging on the wall.
    '';
  };
}
