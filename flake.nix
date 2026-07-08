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
            cp -r ${./.} repo
            chmod -R +w repo
            ${pkgs.nixfmt-tree}/bin/treefmt --ci --tree-root repo
            touch $out
          '';

          unit-tests =
            pkgs.runCommand "verify-exercises"
              {
                buildInputs = with pkgs; [
                  jq
                  nix
                  nix-unit
                ];
                NIX_PATH = "nixpkgs=${nixpkgs}";
              }
              ''
                export HOME=$TMPDIR
                cd ${./.}
                bash bin/verify-exercises
                touch $out
              '';
        }
      );
    };
}
