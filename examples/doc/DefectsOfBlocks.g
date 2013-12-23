#! @System DefectsOfBlocks

LoadPackage( "Blocks" );

#! @Example
G := SmallGroup( 28, 1 );; StructureDescription( G );; G;
#! C7 : C4
DefectsOfBlocks( G, 2 );
#! [ 2, 1, 1, 1 ]
#! @EndExample
