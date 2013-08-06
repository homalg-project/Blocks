##  <#GAPDoc Label="CharacterDegreesOfBlocks">
##  <Example><![CDATA[
##  gap> G := SmallGroup( 28, 1 );; StructureDescription( G );; G;
##  C7 : C4
##  gap> CharacterDegreesOfBlocks( G, 2 );
##  [ [ 1, 1, 1, 1 ], [ 2, 2 ], [ 2, 2 ], [ 2, 2 ] ]
##  ]]></Example>
##  <#/GAPDoc>

LoadPackage( "Blocks" );

G := SmallGroup( 28, 1 );; StructureDescription( G );; G;
Assert( 0, CharacterDegreesOfBlocks( G, 2 ) =
        [ [ 1, 1, 1, 1 ], [ 2, 2 ], [ 2, 2 ], [ 2, 2 ] ] );
