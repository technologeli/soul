{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      overlays = [ inputs.neovim-nightly-overlay.overlay ];
    in
    {
    
      nixosConfigurations = {
        soul = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs; inherit overlays;};
          modules = [ 
            ./hosts/soul/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      };

    };
}
