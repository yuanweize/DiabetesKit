# ============================================================================
# DiabetesKit — Makefile
# Build printable PDF health management tools from LaTeX sources
#
# ✨ Auto-discovery: drop a JSON file into locales/ and run `make all`.
#    No manual registration needed!
#
# Usage:
#   make all        Build every locale found in locales/
#   make zh_CN      Build a single locale (matches filename without .json)
#   make zh         Legacy alias for zh_CN
#   make en         Legacy alias for en_US
#   make list       Show all discovered locales
#   make clean      Remove build artifacts
#   make help       Show this help
# ============================================================================

SHELL     := /bin/bash
BUILD_DIR := build
PDF_DIR   := pdf
SCRIPT    := scripts/gen-locale-tex.py
TEX_SRC   := src/glucose-record.tex

# ── Auto-discover locales ──────────────────────────────────────────
# Find all JSON files, extract locale codes (e.g. zh_CN, en_US, ja_JP)
LOCALE_FILES := $(wildcard locales/*.json)
LOCALE_CODES := $(patsubst locales/%.json,%,$(LOCALE_FILES))

# Convert locale code to short code for PDF naming: zh_CN → zh-cn
to_short = $(shell echo "$(1)" | tr '[:upper:]_' '[:lower:]-')

# Generate PDF paths
PDF_TARGETS := $(foreach loc,$(LOCALE_CODES),$(PDF_DIR)/glucose-record-$(call to_short,$(loc)).pdf)

# ── Phony Targets ──────────────────────────────────────────────────
.PHONY: all clean help list $(LOCALE_CODES)

all: $(PDF_TARGETS)  ## Build all language variants
	@echo ""
	@echo "🎉 All $(words $(LOCALE_CODES)) PDFs built! → $(PDF_DIR)/"

clean:  ## Remove build artifacts and PDFs
	@echo "🧹 Cleaning..."
	@rm -rf $(BUILD_DIR) $(PDF_DIR)
	@echo "✅ Done."

list:  ## Show all discovered locales
	@echo ""
	@echo "📋 Discovered $(words $(LOCALE_CODES)) locale(s):"
	@$(foreach loc,$(LOCALE_CODES),echo "  • $(loc) → glucose-record-$(call to_short,$(loc)).pdf";)
	@echo ""

help:  ## Show available targets
	@echo ""
	@echo "DiabetesKit — Available targets:"
	@echo ""
	@echo "  make all          Build all $(words $(LOCALE_CODES)) languages"
	@echo "  make <LOCALE>     Build a single locale, e.g. make zh_CN"
	@echo "  make zh           Alias for zh_CN (backward compat)"
	@echo "  make en           Alias for en_US (backward compat)"
	@echo "  make list         Show all discovered locales"
	@echo "  make clean        Remove build artifacts"
	@echo "  make help         Show this help"
	@echo ""
	@echo "📋 Discovered locales:"
	@$(foreach loc,$(LOCALE_CODES),echo "  • $(loc)";)
	@echo ""

# ── Legacy Aliases (backward compatibility) ────────────────────────
.PHONY: zh en
zh: zh_CN  ## Alias: Build Simplified Chinese
en: en_US  ## Alias: Build English

# ── Per-locale phony targets: make zh_CN, make ja_JP, etc. ─────────
define locale_phony_target
.PHONY: $(1)
$(1): $(PDF_DIR)/glucose-record-$(call to_short,$(1)).pdf
endef
$(foreach loc,$(LOCALE_CODES),$(eval $(call locale_phony_target,$(loc))))

# ── Generic Build Rule ─────────────────────────────────────────────
# Pattern: pdf/glucose-record-%.pdf where % is the short code (e.g. zh-cn)
# We need to reverse-map short code back to locale code to find the JSON.
#
# Strategy: generate an explicit rule for each locale.
define locale_build_rule
$(PDF_DIR)/glucose-record-$(call to_short,$(1)).pdf: $(TEX_SRC) locales/$(1).json $(SCRIPT)
	@mkdir -p $(BUILD_DIR) $(PDF_DIR)
	@echo "📄 Building: $(1) → $$@"
	@python3 $(SCRIPT) locales/$(1).json > $(BUILD_DIR)/locale.tex
	@cp $(TEX_SRC) $(BUILD_DIR)/
	@cd $(BUILD_DIR) && lualatex -interaction=nonstopmode -halt-on-error \
		-jobname=glucose-record-$(call to_short,$(1)) glucose-record.tex \
		> glucose-record-$(call to_short,$(1)).log 2>&1 \
		|| (echo "❌ Build failed for $(1)! Log:"; tail -30 glucose-record-$(call to_short,$(1)).log; exit 1)
	@cp $(BUILD_DIR)/glucose-record-$(call to_short,$(1)).pdf $(PDF_DIR)/
	@echo "✅ Done: $$@"
endef
$(foreach loc,$(LOCALE_CODES),$(eval $(call locale_build_rule,$(loc))))
