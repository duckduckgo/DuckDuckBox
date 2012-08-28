
BUILDDIR=./build
PWD=$(shell pwd)

intro:
	mkdir -p $(BUILDDIR)/css
	mkdir -p $(BUILDDIR)/js
	

firefox: intro
	cp $(PWD)/css/* $(BUILDDIR)/css 
	cp $(PWD)/js/* $(BUILDDIR)/js


