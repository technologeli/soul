let
  config = {allowUnfree = true;};
  pkgs = import <nixpkgs> {inherit config;};
in
  pkgs.mkShell {
    packages = with pkgs; [
      gef
      openssl
      upx
      ghidra-bin
      unixtools.xxd
      burpsuite

      # stenography
      tenacity
      stegsolve
      binwalk
      steghide
      zsteg
      tcpflow
      wireshark
      # outguess
      exiftool

      pip-audit

      (python3.withPackages (python-pkgs: [
        python-pkgs.pycryptodome
        python-pkgs.pwntools
        python-pkgs.ropgadget
        python-pkgs.capstone
        python-pkgs.scapy
        python-pkgs.sympy
      ]))
    ];
  }
