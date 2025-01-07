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
      direnv
      httpie
      nodejs_23
      deno
    ];
  };

  programs.home-manager.enable = true;
}
