{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "pict";
  version = "3.7.4";

  # GitHubからソースを取得
  src = pkgs.fetchFromGitHub {
    owner = "microsoft";
    repo = "pict";
    rev = "v3.7.4";
    hash = "sha256-APL1DHwJAOqk1dmWtGL7cPlMfnSfsiIpap3CyBu7fbg=";
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
    cp pict $out/bin/
  '';
}