##  <#GAPDoc Label="BrauerCharacterDegreesOfBlocks">
##  <Example><![CDATA[
##  gap> G := SmallGroup( 28, 1 );; StructureDescription( G );; G;
##  C7 : C4
##  gap> BrauerCharacterDegreesOfBlocks( G, 2 );
##  [ [ 1 ], [ 2 ], [ 2 ], [ 2 ] ]
##  ]]></Example>
##  <#/GAPDoc>

LoadPackage( "Blocks" );

G := SmallGroup( 28, 1 );; StructureDescription( G );; G;
Assert( 0, BrauerCharacterDegreesOfBlocks( G, 2 ) =
        [ [ 1 ], [ 2 ], [ 2 ], [ 2 ] ] );
