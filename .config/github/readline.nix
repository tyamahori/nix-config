{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "readline";
  version = "8.2";

  src = pkgs.fetchurl {
    url = "http://ftp.gnu.org/pub/gnu/readline/readline-8.2.tar.gz";
    hash = "sha256-P+txcfFqhO6CyhijbXub4QmlLAT0kqBTMx19EJUAfDU=";
  };

  # ビルドに必要な依;存パッケージ
  buildInputs = [
    pkgs.gnumake
    pkgs.termcap
    pkgs.ncurses
  ];

  # ビルドコマンド
  buildPhase = ''
    ls -la
    ./configure --prefix=`pwd`
    ${pkgs.gnumake}/bin/make
  '';

  # インストールフェーズ
  installPhase = ''
    mkdir -p $out
    ${pkgs.gnumake}/bin/make install DESTDIR=$out
  '';
}