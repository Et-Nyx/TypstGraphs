{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "typst-cards";

  buildInputs = with pkgs; [
    typst
  ];

  shellHook = ''
    echo "Typst Card Template Environment"
    echo "================================"
    echo "Available commands:"
    echo "  typst compile <file.typ>    - Compile a Typst file to PDF"
    echo "  typst watch <file.typ>      - Watch and recompile on changes"
    echo ""
    typst --version
  '';
}
