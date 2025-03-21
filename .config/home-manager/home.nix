{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  username = "tyamahori";
in {
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = username;
    homeDirectory = "/Users/${username}";

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "24.05";

    packages = with pkgs; [
      devbox
      mas
      curl
      git
      httpie
      cmake
      go-task
      vim
      bat
    ];
  };

  programs.home-manager.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
