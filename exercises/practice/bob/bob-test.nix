let
  inherit (import ./bob.nix) response;
in
{
  "test asking a question" = {
    expr = response "Does this cryogenic chamber make me look fat?";
    expected = "Sure.";
  };

  "test shouting" = {
    expr = response "WATCH OUT!";
    expected = "Whoa, chill out!";
  };

  "test forceful question" = {
    expr = response "WHAT'S GOING ON?";
    expected = "Calm down, I know what I'm doing!";
  };

  "test silence" = {
    expr = response "";
    expected = "Fine. Be that way!";
  };

  "test stating something" = {
    expr = response "Tom-ay-to, tom-aaaah-to.";
    expected = "Whatever.";
  };

  "test asking a numeric question" = {
    expr = response "You are, what, like 15?";
    expected = "Sure.";
  };

  "test asking gibberish" = {
    expr = response "fffbbcbeab?";
    expected = "Sure.";
  };

  "test question with no letters" = {
    expr = response "4?";
    expected = "Sure.";
  };

  "test non-letters with question" = {
    expr = response ":) ?";
    expected = "Sure.";
  };

  "test prattling on" = {
    expr = response "Wait! Hang on. Are you going to be OK?";
    expected = "Sure.";
  };

  "test ending with whitespace" = {
    expr = response "Okay if like my  spacebar  quite a bit?   ";
    expected = "Sure.";
  };

  "test multiple line question" = {
    expr = response "\nDoes this cryogenic chamber make\n me look fat?";
    expected = "Sure.";
  };

  "test shouting gibberish" = {
    expr = response "FCECDFCAAB";
    expected = "Whoa, chill out!";
  };

  "test shouting a statement containing a question mark" = {
    expr = response "DO LIONS EAT PEOPLE? AHHHHH.";
    expected = "Whoa, chill out!";
  };

  "test shouting numbers" = {
    expr = response "1, 2, 3 GO!";
    expected = "Whoa, chill out!";
  };

  "test shouting with special characters" = {
    expr = response "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!";
    expected = "Whoa, chill out!";
  };

  "test shouting with no exclamation mark" = {
    expr = response "I HATE THE DENTIST";
    expected = "Whoa, chill out!";
  };

  "test prolonged silence" = {
    expr = response "          ";
    expected = "Fine. Be that way!";
  };

  "test alternate silence" = {
    expr = response "\t\t\t\t\t\t\t\t\t\t";
    expected = "Fine. Be that way!";
  };

  "test other whitespace" = {
    expr = response "\n\r \t";
    expected = "Fine. Be that way!";
  };

  "test talking forcefully" = {
    expr = response "Hi there!";
    expected = "Whatever.";
  };

  "test using acronyms in regular speech" = {
    expr = response "It's OK if you don't want to go work for NASA.";
    expected = "Whatever.";
  };

  "test no letters" = {
    expr = response "1, 2, 3";
    expected = "Whatever.";
  };

  "test statement containing question mark" = {
    expr = response "Ending with ? means a question.";
    expected = "Whatever.";
  };

  "test starting with whitespace" = {
    expr = response "         hmmmmmmm...";
    expected = "Whatever.";
  };

  "test non-question ending with whitespace" = {
    expr = response "This is a statement ending with whitespace      ";
    expected = "Whatever.";
  };
}
