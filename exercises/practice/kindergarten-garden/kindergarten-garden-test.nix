let
  inherit (import ./kindergarten-garden.nix) plants;
in
{
  "test garden with single student" = {
    expr = plants "RC\nGG" "Alice";
    expected = [
      "radishes"
      "clover"
      "grass"
      "grass"
    ];
  };

  "test different garden with single student" = {
    expr = plants "VC\nRC" "Alice";
    expected = [
      "violets"
      "clover"
      "radishes"
      "clover"
    ];
  };

  "test garden with two students" = {
    expr = plants "VVCG\nVVRC" "Bob";
    expected = [
      "clover"
      "grass"
      "radishes"
      "clover"
    ];
  };

  "test second student's garden" = {
    expr = plants "VVCCGG\nVVCCGG" "Bob";
    expected = [
      "clover"
      "clover"
      "clover"
      "clover"
    ];
  };

  "test third student's garden" = {
    expr = plants "VVCCGG\nVVCCGG" "Charlie";
    expected = [
      "grass"
      "grass"
      "grass"
      "grass"
    ];
  };

  "test for Alice, first student's garden" = {
    expr = plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Alice";
    expected = [
      "violets"
      "radishes"
      "violets"
      "radishes"
    ];
  };

  "test for Bob, second student's garden" = {
    expr = plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Bob";
    expected = [
      "clover"
      "grass"
      "clover"
      "clover"
    ];
  };

  "test for Charlie" = {
    expr = plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Charlie";
    expected = [
      "violets"
      "violets"
      "clover"
      "grass"
    ];
  };

  "test for David" = {
    expr = plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "David";
    expected = [
      "radishes"
      "violets"
      "clover"
      "radishes"
    ];
  };

  "test for Eve" = {
    expr = plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Eve";
    expected = [
      "clover"
      "grass"
      "radishes"
      "grass"
    ];
  };

  "test for Fred" = {
    expr = plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Fred";
    expected = [
      "grass"
      "clover"
      "violets"
      "clover"
    ];
  };

  "test for Ginny" = {
    expr = plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Ginny";
    expected = [
      "clover"
      "grass"
      "grass"
      "clover"
    ];
  };

  "test for Harriet" = {
    expr = plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Harriet";
    expected = [
      "violets"
      "radishes"
      "radishes"
      "violets"
    ];
  };

  "test for Ileana" = {
    expr = plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Ileana";
    expected = [
      "grass"
      "clover"
      "violets"
      "clover"
    ];
  };

  "test for Joseph" = {
    expr = plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Joseph";
    expected = [
      "violets"
      "clover"
      "violets"
      "grass"
    ];
  };

  "test for Kincaid, second to last student's garden" = {
    expr = plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Kincaid";
    expected = [
      "grass"
      "clover"
      "clover"
      "grass"
    ];
  };

  "test for Larry, last student's garden" = {
    expr = plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Larry";
    expected = [
      "grass"
      "violets"
      "clover"
      "violets"
    ];
  };
}
