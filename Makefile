TWITTER_BOOTSTRAP = ./twitter-bootstrap
GH_PAGES_DIR = ../pandoc-bootstrap--gh-pages
GIT = /usr/bin/git
DATE=$(shell date)
HASH=$(shell ${GIT} log -1 --pretty=format:%H .)
PATH=$(shell 'pwd')

	pandoc "README.markdown" --toc --standalone --smart --toc --number-sections  --template bootstrap.html5 --output="index.html"
	pandoc "Pandoc-README.markdown" --toc --standalone --smart --toc --number-sections  --template bootstrap.html5 --output="Pandoc-README.generated.html"
# Make the examples
examples: twitter-bootstrap
# new pandoc version (>1.9):
#pandoc "Pandoc-README.markdown" --toc --standalone --smart --toc --section-divs --normalize --number-sections  --template bootstrap.html5 --output="Pandoc-Sample.generated.html"

# Make BOOTSTRAP from git submodule
twitter-bootstrap:
	git submodule init
	git submodule update
	cd ${TWITTER_BOOTSTRAP}
	make bootstrap

# MAKE FOR GH-PAGES 
gh-pages: examples
	mv index.html Pandoc-README.generated.html ${GH_PAGES_DIR}
	rm -rf ${GH_PAGES_DIR}/twitter-bootstrap/bootstrap
	cp -R twitter-bootstrap/bootstrap ${GH_PAGES_DIR}/twitter-bootstrap/bootstrap
	@echo "[!] Made Github Pages on ${PATH}"
	@cd ${GH_PAGES_DIR} && ${GIT} add --all && ${GIT} commit -m "Generated content for 'Github Pages', based on commit ${HASH}" || echo "[X] No changes to commit"
	@echo "[!] Commited changes"


# TODO: WATCH FILES
watch:
	echo "Watching less files..."; \
	watchr -e "watch('less/.*\.less') { system 'make' }"

# TODO: look up if we need it
.PHONY: docs watch gh-pages
