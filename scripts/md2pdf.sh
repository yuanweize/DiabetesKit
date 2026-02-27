#!/usr/bin/env bash
# md2pdf.sh — Convert Pandoc Markdown to PDF via XeLaTeX
# Usage: ./scripts/md2pdf.sh <input.md> <output.pdf>
#
# Environment variables (optional overrides):
#   PDF_ENGINE    — LaTeX engine (default: xelatex)
#   EXTRA_ARGS    — Additional pandoc arguments

set -euo pipefail

# ── Configuration ──────────────────────────────────────────────
PDF_ENGINE="${PDF_ENGINE:-xelatex}"
EXTRA_ARGS="${EXTRA_ARGS:-}"

# ── Argument check ─────────────────────────────────────────────
if [[ $# -lt 2 ]]; then
    echo "Usage: $0 <input.md> <output.pdf>"
    echo ""
    echo "Examples:"
    echo "  $0 templates/blood-glucose-log/zh/blood-glucose-log.md output/zh/blood-glucose-log.pdf"
    exit 1
fi

INPUT="$1"
OUTPUT="$2"

# ── Validate input ─────────────────────────────────────────────
if [[ ! -f "$INPUT" ]]; then
    echo "Error: Input file not found: $INPUT"
    exit 1
fi

# ── Ensure output directory exists ─────────────────────────────
OUTPUT_DIR="$(dirname "$OUTPUT")"
mkdir -p "$OUTPUT_DIR"

# ── Build PDF ──────────────────────────────────────────────────
echo "📄 Converting: $INPUT → $OUTPUT"
echo "   Engine: $PDF_ENGINE"

pandoc "$INPUT" \
    --pdf-engine="$PDF_ENGINE" \
    -o "$OUTPUT" \
    $EXTRA_ARGS

echo "✅ Done: $OUTPUT"
