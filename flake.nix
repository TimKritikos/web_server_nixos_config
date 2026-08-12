{
  description = "Adelie - Most of the internet facing stuff";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";  # match your actual channel

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations.adelie = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix ];
    };
  };
}
