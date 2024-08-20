TEX_FILES = $(wildcard src/*.tex src/*/*.tex src/chapters/*/*.tex)
SRC_DIRS = $(sort $(dir $(wildcard src/*/ src/chapters/*/ ) ) )

OUT_DIR = build
OUT_DIRS = $(patsubst %,$(OUT_DIR)/%,$(SRC_DIRS))
OUT_FLAT = $(OUT_DIR)/flattened.tex

# use tectonic:
LATEX_BUILD_SYSTEM ?= tectonic
# ... or use latexmk?
#LATEX_BUILD_SYSTEM = latexmk

build: $(LATEX_BUILD_SYSTEM)

latexmk: dirs
	latexmk -pvc

tectonic:
	tectonic thesis.tex

.PHONY: build latexmk tectonic

summary: $(LATEX_BUILD_SYSTEM)_summary
summary_ro: $(LATEX_BUILD_SYSTEM)_summary_ro

latexmk_summary: dirs
	latexmk -pvc summary.tex

latexmk_summary_ro: dirs
	latexmk -pvc summary.ro.tex

tectonic_summary:
	tectonic summary.tex

tectonic_summary_ro:
	tectonic summary.ro.tex

.PHONY: summary summary_ro latexmk_summary latexmk_summary_ro tectonic_summary tectonic_summary_ro

dirs:
	@mkdir -p $(OUT_DIRS)

# presentation:
# 	cd beamer/ && latexmk -pvc

clean:
	rm -rf $(OUT_DIR)/ ./*.pdf

flatten: $(OUT_FLAT)
	@echo "Flattened to: $(OUT_FLAT)"
$(OUT_FLAT):
	mkdir -p "$(@D)"
	./scripts/flatten.py thesis.tex > $@

spellcheck: $(OUT_FLAT)
	textidote --check en --output html $(OUT_FLAT) > $(OUT_DIR)/report.html

.PHONY: dirs presentation clean flatten spellcheck

