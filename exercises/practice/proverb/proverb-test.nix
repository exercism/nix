let
  inherit (import ./proverb.nix) recite;
in
{
  "test zero pieces" = {
    expr = recite [ ];
    expected = "";
  };

  "test one piece" = {
    expr = recite [ "nail" ];
    expected = ''
      And all for the want of a nail.
    '';
  };

  "test two pieces" = {
    expr = recite [
      "nail"
      "shoe"
    ];
    expected = ''
      For want of a nail the shoe was lost.
      And all for the want of a nail.
    '';
  };

  "test three pieces" = {
    expr = recite [
      "nail"
      "shoe"
      "horse"
    ];
    expected = ''
      For want of a nail the shoe was lost.
      For want of a shoe the horse was lost.
      And all for the want of a nail.
    '';
  };

  "test full proverb" = {
    expr = recite [
      "nail"
      "shoe"
      "horse"
      "rider"
      "message"
      "battle"
      "kingdom"
    ];
    expected = ''
      For want of a nail the shoe was lost.
      For want of a shoe the horse was lost.
      For want of a horse the rider was lost.
      For want of a rider the message was lost.
      For want of a message the battle was lost.
      For want of a battle the kingdom was lost.
      And all for the want of a nail.
    '';
  };

  "test four pieces modernized" = {
    expr = recite [
      "pin"
      "gun"
      "soldier"
      "battle"
    ];
    expected = ''
      For want of a pin the gun was lost.
      For want of a gun the soldier was lost.
      For want of a soldier the battle was lost.
      And all for the want of a pin.
    '';
  };
}
