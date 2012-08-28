
BUILDDIR=./_build
PWD=$(shell pwd)
CSS=separated

clean:
	rm -rf $(BUILDDIR)

intro:
	mkdir -p $(BUILDDIR)
	mkdir -p $(BUILDDIR)/css
	mkdir -p $(BUILDDIR)/js
	
separated:
	cp $(PWD)/css/* $(BUILDDIR)/css 

onefile:
	cat $(PWD)/css/common.css > $(BUILDDIR)/css/duckduckbox.css
	cat $(PWD)/css/google.css >> $(BUILDDIR)/css/duckduckbox.css
	cat $(PWD)/css/bing.css >> $(BUILDDIR)/css/duckduckbox.css

firefox: intro $(CSS)
	cp $(PWD)/js/*.* $(BUILDDIR)/js
	./targets/firefox.sh


