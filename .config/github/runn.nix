{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "runn";
  version = "main";

  # GitHubからソースを取得
  src = pkgs.fetchFromGitHub {
    owner = "k1LoW";
    repo = "runn";
    rev = "main";
    hash = "sha256-sjs7oIYPl0EX1JYvCOE9a9e2SfWTIBMAM9ZEjSSsI8o=";
  };

  # ビルドに必要な依;存パッケージ
  buildInputs = [
    pkgs.git
    pkgs.gnumake
    pkgs.go
  ];

  # ビルドコマンド
  buildPhase = ''
    # this line removes a bug where value of $HOME is set to a non-writable /homeless-shelter dir
    export HOME=$(pwd)
    ${pkgs.gnumake}/bin/make build
  '';

  # インストールフェーズ
  installPhase = ''
    mkdir -p $out/bin
    install -m 0755 runn $out/bin
  '';
}