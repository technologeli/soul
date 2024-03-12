let
  pkgs = import <nixpkgs> {};
in
  pkgs.mkShell {
    packages = with pkgs; [
      gef
      openssl
      upx
      ghidra-bin
      unixtools.xxd

      # stenography
      tenacity
      stegsolve
      binwalk
      steghide
      zsteg
      outguess
      exiftool

      (python3.withPackages (python-pkgs: [
        python-pkgs.angr
        python-pkgs.pycryptodome
        python-pkgs.pwntools
        python-pkgs.ropgadget
      ]))
    ];
  }
