#! @System CartanMatrixPerBlock

LoadPackage( "Blocks" );

#! @Example
G := SmallGroup( 28, 1 );; StructureDescription( G );; G;
#! C7 : C4
CartanMatrixPerBlock( G, 2 );
#! [ [ [ 4 ] ], [ [ 2 ] ], [ [ 2 ] ], [ [ 2 ] ] ]
#! @EndExample
