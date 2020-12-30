
PREFIX=BPASTS_LaTeX_Template

all: zip

display: compile_template
	evince $(PREFIX)/paper.pdf

compile_template: copy_template
	cd $(PREFIX); pdflatex paper; pdflatex paper
	cd $(PREFIX); bibtex paper; bibtex paper
	cd $(PREFIX); pdflatex paper; pdflatex paper 

copy_template:
	mkdir -p $(PREFIX)
	cp -rf example/* $(PREFIX)
	cp -f bpasts.sty $(PREFIX)
	cp -f README.md $(PREFIX)

clean_template:
	rm -f $(PREFIX)/*.aux	
	rm -f $(PREFIX)/*.blg
	rm -f $(PREFIX)/*.ps
	rm -f $(PREFIX)/*.log
	rm -f $(PREFIX)/*.dvi
	rm -f $(PREFIX)/*.bbl
	rm -f $(PREFIX)/*.out

zip: copy_template compile_template clean_template 
	zip -r $(PREFIX)_`date +%Y%m%d`.zip $(PREFIX)

clean:
	rm -rf $(PREFIX)
	rm -f *~	
	rm -f example/*~

