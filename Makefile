TEX_FILES = $(wildcard src/*.tex src/*/*.tex src/chapters/*/*.tex)
SRC_DIRS = $(sort $(dir $(wildcard src/*/ src/chapters/*/ ) ) )

OUT_DIR = build
OUT_DIRS = $(patsubst %,$(OUT_DIR)/%,$(SRC_DIRS))
OUT_FLAT = $(OUT_DIR)/flattened.tex

# use tectonic:
LATEX_BUILD_SYSTEM = tectonic
# ... or use latexmk?
#LATEX_BUILD_SYSTEM = latexmk

build: $(LATEX_BUILD_SYSTEM)

latexmk: dirs
	latexmk -pvc

tectonic:
	tectonic thesis.tex

.PHONY: build latexmk tectonic

dirs:
	@mkdir -p $(OUT_DIRS)

# presentation:
# 	cd beamer/ && latexmk -pvc

clean:
	rm -rf $(OUT_DIR)/ ./*.pdf

