#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

# Run twice so the table of contents and cross-references resolve correctly.
pdflatex -interaction=nonstopmode -jobname=cse753 main.tex
pdflatex -interaction=nonstopmode -jobname=cse753 main.tex

echo "Done. Output: cse753.pdf"