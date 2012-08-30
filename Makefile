TWITTER_BOOTSTRAP = ./twitter-bootstrap
DATE=$(shell date)

# Make the samples
samples: twitter-bootstrap
	pandoc "Pandoc-Sample.markdown" --toc --standalone --smart --toc --number-sections  --template bootstrap.html5 --output="Pandoc-Sample.generated.html"
# new pandoc version (>1.9):
#pandoc "Pandoc-Sample.markdown" --toc --standalone --smart --toc --section-divs --normalize --number-sections  --template bootstrap.html5 --output="Pandoc-Sample.generated.html"

# Make BOOTSTRAP from git submodule
twitter-bootstrap:
	git submodule init
	git submodule update
	cd ${TWITTER_BOOTSTRAP}
	make bootstrap

# TODO: MAKE FOR GH-PAGES 
gh-pages: twitter-bootstrap
	pandoc "README.markdown" --toc --standalone --smart --toc --number-sections  --template bootstrap.html5 --output="index.html"
	pandoc "Pandoc-README.markdown" --toc --standalone --smart --toc --number-sections  --template bootstrap.html5 --output="Pandoc-README.generated.html"


# TODO: WATCH FILES
watch:
	echo "Watching less files..."; \
	watchr -e "watch('less/.*\.less') { system 'make' }"

# TODO: look up if we need it
.PHONY: docs watch gh-pages
