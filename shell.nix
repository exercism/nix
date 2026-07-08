{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    nixfmt-tree
    nix-unit
    statix
    jq
  ];
}
