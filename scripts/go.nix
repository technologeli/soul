let
  config = {allowUnfree = true;};
  pkgs = import <nixpkgs> {inherit config;};
in
  pkgs.mkShell {
    packages = with pkgs; [
      go
      air
    ];
  }
