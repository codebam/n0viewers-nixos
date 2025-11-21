{
  description = "N0Viewers NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lix = {
      url = "git+https://git.lix.systems/lix-project/lix.git";
      flake = false;
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lix-module = {
      url = "git+https://git.lix.systems/lix-project/nixos-module.git";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.lix.follows = "lix";
    };
    agenix.url = "github:ryantm/agenix";
    stylix.url = "github:danth/stylix";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    run0-sudo-shim = {
      url = "github:lordgrimmauld/run0-sudo-shim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lsfg-vk-flake = {
      url = "github:pabloaul/lsfg-vk-flake/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    let
      forAllSystems =
        functionProvidedToForAllSystems:
        nixpkgs.lib.genAttrs
          [
            "x86_64-linux"
          ]
          (
            system:
            functionProvidedToForAllSystems (
              import nixpkgs {
                inherit system;
                overlays = [
                ];
                config = {
                  # You can add common pkgs configurations here, e.g.:
                  # allowUnfree = true;
                  # cudaSupport = true;
                  # TODO: remove this if you don't want nvidia cuda support. i.e. in blender, ollama, etc.
                };
              }
            )
          );

      # Helper function to define a NixOS system
      mkNixosSystem =
        { system
        , extraModules ? [ ]
        ,
        }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          # Pass all flake inputs to NixOS modules
          specialArgs = { inherit inputs; };
          modules = [
            inputs.lix-module.nixosModules.default
            inputs.disko.nixosModules.disko
            inputs.stylix.nixosModules.stylix
            inputs.home-manager.nixosModules.home-manager
            inputs.nix-index-database.nixosModules.nix-index
            inputs.run0-sudo-shim.nixosModules.default
            inputs.lsfg-vk-flake.nixosModules.default
            ./modules
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.n0viewers = {
                  imports = [ ./home ];
                };
                sharedModules = [
                  inputs.agenix.homeManagerModules.default
                ];
              };
            }
          ] ++ extraModules;
        };

    in
    {
      nixosConfigurations = {
        n0viewers-nixos = mkNixosSystem {
          system = "x86_64-linux";
          extraModules = [
            ./laptop-specific/configuration
            {
              home-manager.users.n0viewers.imports = [
                ./laptop-specific/home.nix
              ];
            }
          ];
        };
      };
    };
}
