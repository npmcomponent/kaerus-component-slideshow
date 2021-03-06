all: build

build: dependencies standalone
	@echo "Building component "
	@component build -v

standalone: 
	@echo "Building standalone version"
	@component build -v -n slideshow -s Slideshow

gem: standalone
	@make -C ./gem all

dependencies:
	@component install 
	@component convert template.html   

distclean:
	@echo "Cleaning upp files"
	@rm -rf ./node_modules
	@rm -rf ./components
	@rm -rf ./build
	@make -C ./gem distclean


.PHONY: all