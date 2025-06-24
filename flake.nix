{
  description = "Minimal package definition for aarch64-darwin";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-24.11-darwin";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
     url = "github:LnL7/nix-darwin/nix-darwin-24.11";
     inputs.nixpkgs.follows = "nixpkgs";
   };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-darwin,
    ...
  } @ inputs: let
    system = "aarch64-darwin";
    pkgs = import nixpkgs { inherit system; };
  in {
    apps.${system}.update = {
      type = "app";
      program = toString (pkgs.writeShellScript "update-script" ''
        set -e
        echo "Updating flake..."
        nix flake update
        echo "Building apps..."
#        nix-build ./.config/github/pict.nix -o result/pict && nix profile install ./result/pict
#        nix-build ./.config/github/runn.nix -o result/runn && nix profile install ./result/runn
        echo "Updating home-manager..."
        nix run nixpkgs#home-manager -- switch --flake .#myHomeConfig
        sudo arch -arm64 nix run nix-darwin -- switch --flake .#tyamahori-darwin
        arch -arm64 brew upgrade
        arch -arm64 brew upgrade --cask --greedy
        arch -arm64 brew cleanup
        mas upgrade
        echo "Update complete!"
      '');
    };

    homeConfigurations = {
      myHomeConfig = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [
          ./.config/home-manager/home.nix
        ];
      };
    };

    darwinConfigurations.tyamahori-darwin = nix-darwin.lib.darwinSystem {
      system = system;
      modules = [ ./.config/nix-darwin/default.nix ];
   };
  };
}