
PREFIX=BPASTS_LaTeX_Template

all: zip

display: test
	evince $(PREFIX)/paper.pdf

test: copy_template
	cd $(PREFIX); pdflatex paper.tex; pdflatex paper.tex 

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

zip: copy_template test clean_template 
	zip -r $(PREFIX)_`date +%Y%m%d`.zip $(PREFIX)

clean:
	rm -rf $(PREFIX)
	rm -f *~	
	rm -f example/*~

