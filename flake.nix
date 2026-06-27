{
  description = "Something that has grown beyond TTS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        python-with-deps = pkgs.python3.withPackages (ps: with ps; [
        ]);
      in {
        devShells.default = pkgs.mkShell {
          name = "chat-tts";

          nativeBuildInputs = [
          ];

          buildInputs = [
            python-with-deps
          ];

          shellHook = ''
          '';
        };
      });
}
