BUILD_DIR = build

.PHONY: all it en init watch-it watch-en clean

all: it en

# Inizializza la cartella content/ da content.example/ se non esiste ancora
init:
	@if [ ! -d "content" ]; then \
		echo "Inizializzazione content/ da content.example/..."; \
		cp -r content.example content; \
	fi

it: init
	@mkdir -p $(BUILD_DIR)
	latexmk -pdf -outdir=$(BUILD_DIR) cv_it.tex
	@cp $(BUILD_DIR)/cv_it.pdf .
	@echo "==> PDF Italiano generato: cv_it.pdf"

en: init
	@mkdir -p $(BUILD_DIR)
	latexmk -pdf -outdir=$(BUILD_DIR) cv_en.tex
	@cp $(BUILD_DIR)/cv_en.pdf .
	@echo "==> PDF Inglese generato: cv_en.pdf"

watch-it: init
	latexmk -pdf -pvc -outdir=$(BUILD_DIR) cv_it.tex

watch-en: init
	latexmk -pdf -pvc -outdir=$(BUILD_DIR) cv_en.tex

clean:
	latexmk -C -outdir=$(BUILD_DIR)
	rm -rf $(BUILD_DIR) cv_it.pdf cv_en.pdf main.pdf
