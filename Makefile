# Makefile

# Variáveis
CLEAN_SCRIPT = aulas/clean.sh
TEX_FILES = $(wildcard aulas/aula*.tex)
LAST_TEX_FILE = $(shell ls -t $(TEX_FILES) | head -n 1)

# Alvos
.PHONY: clean last

all:
	@echo "Compilando todos os arquivos LaTeX na pasta aulas..."
	@cd aulas && for file in $(TEX_FILES); do pdflatex -interaction=nonstopmode $$file; done


clean:
	@echo "Limpando arquivos temporários..."
	@sh $(CLEAN_SCRIPT)

last:
	@echo "Compilando o arquivo LaTeX mais recente: $(LAST_TEX_FILE)"
	@cd aulas && pdflatex -interaction=nonstopmode ../$(LAST_TEX_FILE)

# make compile FILE=aula01.tex
compile:
	@echo "Compilando o arquivo LaTeX especificado: $(FILE)"
	@cd aulas && pdflatex -interaction=nonstopmode $(FILE)