#!/bin/bash
# ============================================================
#  Build script for Blockchain Technology Report
#  Usage:  chmod +x build.sh && ./build.sh
# ============================================================

set -e

echo "=== Pass 1: pdflatex ==="
pdflatex -interaction=nonstopmode main.tex

echo "=== BibTeX ==="
bibtex main

echo "=== Glossaries ==="
makeglossaries main

echo "=== Pass 2: pdflatex ==="
pdflatex -interaction=nonstopmode main.tex

echo "=== Pass 3: pdflatex (resolve cross-refs) ==="
pdflatex -interaction=nonstopmode main.tex

echo ""
echo "=== Build complete! Output: main.pdf ==="
