default: test

test:
	nodeunit ./test/routes.js

deploy:
	# transform all markdown into html with pygments for highlighting
	@for file in ./posts/*.md; do ./util/highlighter $$file $$file.html; done


.PHONY: all test
