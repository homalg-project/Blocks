all: doc test

doc: doc/manual.six

doc/manual.six: makedoc.g maketest.g ListOfDocFiles.g \
		PackageInfo.g \
		doc/Blocks.bib doc/*.xml \
		gap/*.gd gap/*.gi examples/*.g
	        gap makedoc.g

clean:
	(cd doc ; ./clean)

test:	doc
	gap maketest.g

archive: test
	(mkdir -p ../tar; cd ..; tar czvf tar/Blocks.tar.gz --exclude ".DS_Store" --exclude "*~" Blocks/doc/*.* Blocks/doc/clean Blocks/gap/*.{gi,gd} Blocks/{CHANGES,PackageInfo.g,README,VERSION,init.g,read.g,makedoc.g,makefile,maketest.g,ListOfDocFiles.g,createautodoc.g} Blocks/examples/*.g)

WEBPOS=public_html
WEBPOS_FINAL=~/Sites/homalg-project/Blocks

towww: archive
	echo '<?xml version="1.0" encoding="UTF-8"?>' >${WEBPOS}.version
	echo '<mixer>' >>${WEBPOS}.version
	cat VERSION >>${WEBPOS}.version
	echo '</mixer>' >>${WEBPOS}.version
	cp PackageInfo.g ${WEBPOS}
	cp README ${WEBPOS}/README.Blocks
	cp doc/manual.pdf ${WEBPOS}/Blocks.pdf
	cp doc/*.{css,html} ${WEBPOS}
	rm -f ${WEBPOS}/*.tar.gz
	mv ../tar/Blocks.tar.gz ${WEBPOS}/Blocks-`cat VERSION`.tar.gz
	rm -f ${WEBPOS_FINAL}/*.tar.gz
	cp ${WEBPOS}/* ${WEBPOS_FINAL}
	ln -s Blocks-`cat VERSION`.tar.gz ${WEBPOS_FINAL}/Blocks.tar.gz

