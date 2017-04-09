SITE=$(PROJECTS)/src/github.com/benburwell/benburwell.github.io
DESTINATIONS=$(SITE)/resume.pdf $(SITE)/assets/pdf/Ben_Burwell_Resume.pdf

resume.pdf: resume.tex
	pdflatex resume.tex

publish: resume.pdf
	for dest in $(DESTINATIONS); do \
		cp resume.pdf "$$dest" ; \
	done
	echo "Resume PDF has been copied to $(SITE)"

.PHONY: publish
