{
  description = "Adelie - Most of the internet facing stuff";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";  # match your actual channel

  inputs.sops-nix = {
    url = "github:Mic92/sops-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };


  outputs = { self, nixpkgs, sops-nix, ... }: {
    nixosConfigurations.adelie = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        sops-nix.nixosModules.sops
      ];
    };
  };
}
