# ============================================================================
# DiabetesKit — Makefile
# Build printable PDF health management tools from LaTeX sources
# ============================================================================

SHELL     := /bin/bash
BUILD_DIR := build
PDF_DIR   := pdf
SCRIPT    := scripts/gen-locale-tex.py
TEX_SRC   := src/glucose-record.tex

# ── Targets ────────────────────────────────────────────────────────
.PHONY: all zh en clean help

all: zh en  ## Build all language variants
	@echo ""
	@echo "🎉 All PDFs built! → $(PDF_DIR)/"

zh: $(PDF_DIR)/glucose-record-zh.pdf  ## Build Chinese PDF

en: $(PDF_DIR)/glucose-record-en.pdf  ## Build English PDF

clean:  ## Remove build artifacts and PDFs
	@echo "🧹 Cleaning..."
	@rm -rf $(BUILD_DIR) $(PDF_DIR)
	@echo "✅ Done."

help:  ## Show available targets
	@echo ""
	@echo "DiabetesKit — Available targets:"
	@grep -E '^[a-zA-Z_-]+:.*##' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*## "}; {printf "  make %-10s %s\n", $$1, $$2}'
	@echo ""

# ── Build Rules ────────────────────────────────────────────────────
define build_pdf
	@mkdir -p $(BUILD_DIR) $(PDF_DIR)
	@echo "📄 Building: $(1) → $(PDF_DIR)/glucose-record-$(2).pdf"
	@python3 $(SCRIPT) locales/$(1).json > $(BUILD_DIR)/locale.tex
	@cp $(TEX_SRC) $(BUILD_DIR)/
	@cd $(BUILD_DIR) && lualatex -interaction=nonstopmode -halt-on-error \
		-jobname=glucose-record-$(2) glucose-record.tex > glucose-record-$(2).log 2>&1 \
		|| (echo "❌ Build failed! Log:"; cat glucose-record-$(2).log; exit 1)
	@cp $(BUILD_DIR)/glucose-record-$(2).pdf $(PDF_DIR)/
	@echo "✅ Done: $(PDF_DIR)/glucose-record-$(2).pdf"
endef

$(PDF_DIR)/glucose-record-zh.pdf: $(TEX_SRC) locales/zh_CN.json $(SCRIPT)
	$(call build_pdf,zh_CN,zh)

$(PDF_DIR)/glucose-record-en.pdf: $(TEX_SRC) locales/en_US.json $(SCRIPT)
	$(call build_pdf,en_US,en)
