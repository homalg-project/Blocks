##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##  
##  Call this with GAP.
##

LoadPackage( "AutoDoc" );

CreateAutomaticDocumentation( "Blocks", "gap/AutoDocEntries.g", "doc/", false );

LoadPackage( "Modules" );

SetGapDocLaTeXOptions( "utf8" );

bib := ParseBibFiles( "doc/Blocks.bib" );
WriteBibXMLextFile( "doc/BlocksBib.xml", bib );

Read( "ListOfDocFiles.g" );

PrintTo( "VERSION", PackageInfo( "Blocks" )[1].Version );

MakeGAPDocDoc( "doc", "Blocks", list, "Blocks", "MathJax" );

CopyHTMLStyleFiles( "doc" );

GAPDocManualLab( "Blocks" );

QUIT;
