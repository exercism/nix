let
  inherit (import ./largest-series-product.nix) largestProduct;
in
{
  "test finds the largest product if span equals length" = {
    expr = largestProduct "29" 2;
    expected = 18;
  };

  "test can find the largest product of 2 with numbers in order" = {
    expr = largestProduct "0123456789" 2;
    expected = 72;
  };

  "test can find the largest product of 2" = {
    expr = largestProduct "576802143" 2;
    expected = 48;
  };

  "test can find the largest product of 3 with numbers in order" = {
    expr = largestProduct "0123456789" 3;
    expected = 504;
  };

  "test can find the largest product of 3" = {
    expr = largestProduct "1027839564" 3;
    expected = 270;
  };

  "test can find the largest product of 5 with numbers in order" = {
    expr = largestProduct "0123456789" 5;
    expected = 15120;
  };

  "test can get the largest product of a big number" = {
    expr = largestProduct "73167176531330624919225119674426574742355349194934" 6;
    expected = 23520;
  };

  "test reports zero if the only digits are zero" = {
    expr = largestProduct "0000" 2;
    expected = 0;
  };

  "test reports zero if all spans include zero" = {
    expr = largestProduct "99099" 3;
    expected = 0;
  };

  "test rejects span longer than string length" = {
    expr = largestProduct "123" 4;
    expectedError.type = "ThrownError";
    expectedError.msg = "span must not exceed string length";
  };

  "test reports 1 for empty string and empty product (0 span)" = {
    expr = largestProduct "" 0;
    expected = 1;
  };

  "test reports 1 for nonempty string and empty product (0 span)" = {
    expr = largestProduct "123" 0;
    expected = 1;
  };

  "test rejects empty string and nonzero span" = {
    expr = largestProduct "" 1;
    expectedError.type = "ThrownError";
    expectedError.msg = "span must not exceed string length";
  };

  "test rejects invalid character in digits" = {
    expr = largestProduct "1234a5" 2;
    expectedError.type = "ThrownError";
    expectedError.msg = "digits input must only contain digits";
  };

  "test rejects negative span" = {
    expr = largestProduct "12345" (-1);
    expectedError.type = "ThrownError";
    expectedError.msg = "span must not be negative";
  };
}
