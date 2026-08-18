#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

mkdir -p build

# Run twice so the table of contents and cross-references resolve correctly.
(cd src && pdflatex -interaction=nonstopmode -output-directory=../build -jobname=cse753 main.tex)
(cd src && pdflatex -interaction=nonstopmode -output-directory=../build -jobname=cse753 main.tex)

cp build/cse753.pdf cse753.pdf

echo "Done. Output: cse753.pdf"
