{
  description = "Minimal package definition for aarch64-darwin";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
     url = "github:LnL7/nix-darwin";
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
        nix-build ./.config/github/pict.nix && nix profile install ./result
        echo "Updating home-manager..."
        nix run nixpkgs#home-manager -- switch --flake .#myHomeConfig
        arch -arm64 nix run nix-darwin -- switch --flake .#tyamahori-darwin
        echo "Update complete!"
        echo "GC ...."
        nix-store --gc
        echo "GC complete!"
        echo "Sourcing ...."
        source $HOME/.zshrc
        echo "Sourcing complete!"
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