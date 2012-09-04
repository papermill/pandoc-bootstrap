TWITTER_BOOTSTRAP = ./twitter-bootstrap
GH_PAGES_DIR = ../pandoc-bootstrap--gh-pages
GIT = /usr/bin/git
PANDOC = ~/.cabal/bin/pandoc

DATE=$(shell date)
HASH=$(shell ${GIT} log -1 --pretty=format:%H .)
PATH=$(shell 'pwd')

# Make the examples
examples:
	${PANDOC} "README.markdown" --toc --standalone --smart --toc --number-sections  --template bootstrap.html5 --output="output/index.html"
	${PANDOC} "examples/Pandoc-README.markdown" --toc --standalone --smart --toc --number-sections  --template bootstrap.html5 --output="output/Pandoc-README.generated.html"
	${PANDOC} "examples/book-curie-radio-de/curie.md" --toc --standalone --smart --toc --number-sections  --template bootstrap.html5 --output="output/curie-radio-de.html"
# new pandoc version (>1.9):
#${PANDOC} "examples/Pandoc-README.markdown" --toc --standalone --smart --toc --section-divs --normalize --number-sections  --template bootstrap.html5 --output="output/Pandoc-Sample.generated.html"

# Make BOOTSTRAP from git submodule
twitter-bootstrap:
	git submodule init
	git submodule update
	cd ${TWITTER_BOOTSTRAP}
	make bootstrap

# MAKE FOR GH-PAGES 
gh-pages: examples
	cp output/index.html output/Pandoc-README.generated.html output/curie-radio-de.html ${GH_PAGES_DIR}/
	rm -rf ${GH_PAGES_DIR}/twitter-bootstrap/bootstrap
	cp -R twitter-bootstrap/bootstrap ${GH_PAGES_DIR}/twitter-bootstrap/bootstrap
	@echo "[!] Made Github Pages on ${PATH}"
	@cd ${GH_PAGES_DIR} && ${GIT} add --all && ${GIT} commit -m "Generated content for 'Github Pages', based on commit ${HASH}" || echo "[X] No changes to commit"
	@echo "[!] Commited changes"


# TODO: WATCH FILES
watch:
	echo "Watching less files..."; \
	watchr -e "watch('less/.*\.less') { system 'make' }"

# UNLAZY RENDERING: 
#'phony' means make will just the named targets without checking -- no more "is up to date".
.PHONY: examples twitter-bootstrap gh-pages watch
