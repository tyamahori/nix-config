{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {

  pname = "readline";
  version = "master";

  src = fetchGit {
    url = "https://git.savannah.gnu.org/git/readline";
    ref = "master";
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