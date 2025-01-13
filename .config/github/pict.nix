{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "pict";
  version = "3.7.4";

  # GitHubからソースを取得
  src = pkgs.fetchFromGitHub {
    owner = "microsoft";
    repo = "pict";
    rev = "main";
    hash = "sha256-sG/Kv5JL6h0YYXmr7F5dVtjgAPzEkQCtqS+ZpcUnOxw=";
  };

  # ビルドに必要な依;存パッケージ
  buildInputs = [ pkgs.gnumake ];

  # ビルドコマンド
  buildPhase = ''
    ${pkgs.gnumake}/bin/make pict
  '';

  # インストールフェーズ
  installPhase = ''
    mkdir -p $out/bin
    install -m 0755 pict $out/bin
  '';
}