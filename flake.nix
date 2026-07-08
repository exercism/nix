{
  description = "Exercism Nix track exercises";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      inherit (nixpkgs) lib;
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = lib.genAttrs systems;
      pkgsFor = system: nixpkgs.legacyPackages.${system};
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = pkgsFor system;
        in
        {
          default = import ./shell.nix { inherit pkgs; };
        }
      );

      formatter = forAllSystems (system: (pkgsFor system).nixfmt-tree);

      checks = forAllSystems (
        system:
        let
          pkgs = pkgsFor system;
        in
        {
          linting = pkgs.runCommand "linting-check" { } ''
            ${pkgs.statix}/bin/statix check ${./.}
            touch $out
          '';

          formatting = pkgs.runCommand "formatting-check" { } ''
            ${pkgs.nixfmt-tree}/bin/treefmt --ci --tree-root ${./.}
            touch $out
          '';

          unit-tests =
            pkgs.runCommand "verify-exercises"
              {
                src = ./.;
                buildInputs = with pkgs; [
                  jq
                  nix
                ];
                NIX_PATH = "nixpkgs=${nixpkgs}";
                NIX_CONFIG = "experimental-features = nix-command";
              }
              ''
                export HOME=$TMPDIR
                cd $src
                bash bin/verify-exercises
                touch $out
              '';
        }
      );
    };
}
