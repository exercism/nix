let
  inherit (import ./word-count.nix) countWords;
in
{
  "test count one word" = {
    expr = countWords "word";
    expected = {
      word = 1;
    };
  };

  "test count one of each word" = {
    expr = countWords "one of each";
    expected = {
      one = 1;
      of = 1;
      each = 1;
    };
  };

  "test multiple occurrences of a word" = {
    expr = countWords "one fish two fish red fish blue fish";
    expected = {
      one = 1;
      fish = 4;
      two = 1;
      red = 1;
      blue = 1;
    };
  };

  "test handles cramped lists" = {
    expr = countWords "one,two,three";
    expected = {
      one = 1;
      two = 1;
      three = 1;
    };
  };

  "test handles expanded lists" = {
    expr = countWords "one,\ntwo,\nthree";
    expected = {
      one = 1;
      two = 1;
      three = 1;
    };
  };

  "test ignore punctuation" = {
    expr = countWords "car: carpet as java: javascript!!&@$%^&";
    expected = {
      car = 1;
      carpet = 1;
      as = 1;
      java = 1;
      javascript = 1;
    };
  };

  "test include numbers" = {
    expr = countWords "testing, 1, 2 testing";
    expected = {
      testing = 2;
      "1" = 1;
      "2" = 1;
    };
  };

  "test normalize case" = {
    expr = countWords "go Go GO Stop stop";
    expected = {
      go = 3;
      stop = 2;
    };
  };

  "test with apostrophes" = {
    expr = countWords "'First: don't laugh. Then: don't cry. You're getting it.'";
    expected = {
      first = 1;
      "don't" = 2;
      laugh = 1;
      "then" = 1;
      cry = 1;
      "you're" = 1;
      getting = 1;
      it = 1;
    };
  };

  "test with quotations" = {
    expr = countWords "Joe can't tell between 'large' and large.";
    expected = {
      joe = 1;
      "can't" = 1;
      tell = 1;
      between = 1;
      large = 2;
      and = 1;
    };
  };

  "test substrings from the beginning" = {
    expr = countWords "Joe can't tell between app, apple and a.";
    expected = {
      joe = 1;
      "can't" = 1;
      tell = 1;
      between = 1;
      app = 1;
      apple = 1;
      and = 1;
      a = 1;
    };
  };

  "test multiple spaces not detected as a word" = {
    expr = countWords " multiple   whitespaces";
    expected = {
      multiple = 1;
      whitespaces = 1;
    };
  };

  "test alternating word separators not detected as a word" = {
    expr = countWords ",\n,one,\n ,two \n 'three'";
    expected = {
      one = 1;
      two = 1;
      three = 1;
    };
  };

  "test quotation for word with apostrophe" = {
    expr = countWords "can, can't, 'can't'";
    expected = {
      can = 1;
      "can't" = 2;
    };
  };
}
