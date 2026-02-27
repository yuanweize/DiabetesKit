# ============================================================================
# DiabetesKit — Makefile
# Build all templates into printable PDFs
# ============================================================================

SHELL      := /bin/bash
SCRIPT     := scripts/md2pdf.sh
OUTPUT_DIR := output

# ── Template Registry ──────────────────────────────────────────
# Add new templates here. Format: <template-dir>/<lang>/<filename-without-ext>
TEMPLATES := \
	blood-glucose-log/zh/blood-glucose-log \
	blood-glucose-log/en/blood-glucose-log

# ── Derived paths ──────────────────────────────────────────────
SOURCES := $(foreach t,$(TEMPLATES),templates/$(t).md)
PDFS    := $(foreach t,$(TEMPLATES),$(OUTPUT_DIR)/$(t).pdf)

# ============================================================================
# Targets
# ============================================================================

.PHONY: all zh en clean help

## Build all PDFs (all languages)
all: $(PDFS)
	@echo ""
	@echo "🎉 All PDFs built successfully!"
	@echo "   Output directory: $(OUTPUT_DIR)/"

## Build Chinese PDFs only
zh: $(filter $(OUTPUT_DIR)/%-zh/%.pdf $(OUTPUT_DIR)/%/zh/%.pdf,$(PDFS))
	@# Filter Chinese outputs
	@$(MAKE) $(foreach t,$(filter blood-glucose-log/zh/%,$(TEMPLATES)),$(OUTPUT_DIR)/$(t).pdf)

## Build English PDFs only
en:
	@$(MAKE) $(foreach t,$(filter blood-glucose-log/en/%,$(TEMPLATES)),$(OUTPUT_DIR)/$(t).pdf)

## Remove all built PDFs
clean:
	@echo "🧹 Cleaning output directory..."
	rm -rf $(OUTPUT_DIR)
	@echo "✅ Clean complete."

## Show this help message
help:
	@echo ""
	@echo "DiabetesKit — Available targets:"
	@echo "  make all     Build all PDFs (all languages)"
	@echo "  make zh      Build Chinese PDFs only"
	@echo "  make en      Build English PDFs only"
	@echo "  make clean   Remove all built PDFs"
	@echo "  make help    Show this help message"
	@echo ""
	@echo "Output directory: $(OUTPUT_DIR)/"
	@echo ""

# ── Generic build rule ─────────────────────────────────────────
$(OUTPUT_DIR)/%.pdf: templates/%.md $(SCRIPT)
	@bash $(SCRIPT) "$<" "$@"
