SITE=$(PROJECTS)/src/github.com/benburwell/benburwell.github.io
DESTINATIONS=$(SITE)/resume.pdf $(SITE)/assets/pdf/Ben_Burwell_Resume.pdf

resume.pdf: resume.tex
	pdflatex resume.tex

publish: resume.pdf
	for dest in $(DESTINATIONS); do \
		cp resume.pdf "$$dest" ; \
	done
	for dest in $(DESTINATIONS); do \
		cd $(SITE) && git add "$$dest" ; \
	done
	cd $(SITE) && git commit -am "Update resume"
	cd $(SITE) && git push origin master

.PHONY: publish
