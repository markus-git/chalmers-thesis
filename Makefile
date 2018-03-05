# LaTeX Makefile
FILE=paper

all: $(FILE).pdf

.PHONY: clean

clean:
	rm -rf *.blg 
	rm -rf *.out 
	rm -rf *.bbl 
	rm -rf *.log
	rm -rf *.ind
	rm -rf *.ilg
	rm -rf *.lot
	rm -rf *.lof
	rm -rf *.ind
	rm -rf *.idx
	rm -rf *.aux
	rm -rf *.toc
	rm -f ${FILE}.pdf


$(FILE).pdf: *.tex *.bib *.sty kappa/*.tex
	pdflatex -shell-escape $(FILE)
	pdflatex -shell-escape $(FILE)
	makeindex $(FILE)
	biber $(FILE)
	pdflatex -shell-escape $(FILE)
	pdflatex -shell-escape $(FILE)
