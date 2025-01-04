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
      git
      curl
      bun
      cmake
      mas
      php84
      php84Packages.composer
      php84Extensions.xdebug
      direnv
      go
    ];
  };

  programs.home-manager.enable = true;
}