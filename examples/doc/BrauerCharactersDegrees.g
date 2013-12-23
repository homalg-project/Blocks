#! @System BrauerCharactersDegrees

LoadPackage( "Blocks" );

#! @Example
G := SmallGroup( 28, 1 );; StructureDescription( G );; G;
#! C7 : C4
BrauerCharactersDegrees( G, 2 );
#! [ [ 1 ], [ 2 ], [ 2 ], [ 2 ] ]
#! @EndExample
