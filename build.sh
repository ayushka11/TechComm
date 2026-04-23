#!/bin/bash
# ============================================================
#  Build script for Blockchain Technology Report
#  Usage:  chmod +x build.sh && ./build.sh
# ============================================================

set -e

# if [[ -f "iitr-logo.svg" ]]; then
# 	if [[ ! -f "iitr-logo.pdf" || "iitr-logo.svg" -nt "iitr-logo.pdf" ]]; then
# 		echo "=== Converting iitr-logo.svg to iitr-logo.pdf ==="
# 		if command -v inkscape >/dev/null 2>&1; then
# 			inkscape iitr-logo.svg --export-type=pdf --export-filename=iitr-logo.pdf >/dev/null
# 		elif command -v rsvg-convert >/dev/null 2>&1; then
# 			rsvg-convert -f pdf -o iitr-logo.pdf iitr-logo.svg
# 		elif command -v cairosvg >/dev/null 2>&1; then
# 			cairosvg iitr-logo.svg -o iitr-logo.pdf
# 		else
# 			echo "Warning: No SVG converter found (inkscape/rsvg-convert/cairosvg)."
# 			echo "         Watermark will be skipped until iitr-logo.pdf is generated."
# 		fi
# 	fi
# fi

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
