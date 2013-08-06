##  <#GAPDoc Label="CartanMatricesOfBlocks">
##  <Example><![CDATA[
##  gap> G := SmallGroup( 28, 1 );; StructureDescription( G );; G;
##  C7 : C4
##  gap> CartanMatricesOfBlocks( G, 2 );
##  [ [ [ 4 ] ], [ [ 2 ] ], [ [ 2 ] ], [ [ 2 ] ] ]
##  ]]></Example>
##  <#/GAPDoc>

LoadPackage( "Blocks" );

G := SmallGroup( 28, 1 );; StructureDescription( G );; G;
Assert( 0, CartanMatricesOfBlocks( G, 2 ) =
        [ [ [ 4 ] ], [ [ 2 ] ], [ [ 2 ] ], [ [ 2 ] ] ] );
