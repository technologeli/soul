let
  pkgs = import <nixpkgs> {};
in
  pkgs.mkShell {
    packages = with pkgs; [
      gef
      (python3.withPackages (python-pkgs: [
        python-pkgs.pycryptodome
        python-pkgs.pwntools
        python-pkgs.ropgadget
      ]))
    ];
  }
