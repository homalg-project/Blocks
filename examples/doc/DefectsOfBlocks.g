##  <#GAPDoc Label="DefectsOfBlocks">
##  <Example><![CDATA[
##  gap> G := SmallGroup( 28, 1 );; StructureDescription( G );; G;
##  C7 : C4
##  gap> DefectsOfBlocks( G, 2 );
##  [ 2, 1, 1, 1 ]
##  ]]></Example>
##  <#/GAPDoc>

LoadPackage( "Blocks" );

G := SmallGroup( 28, 1 );; StructureDescription( G );; G;
Assert( 0, DefectsOfBlocks( G, 2 ) = [ 2, 1, 1, 1 ] );
