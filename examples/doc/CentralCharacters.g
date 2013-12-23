#! @System CentralCharacters

LoadPackage( "Blocks" );

#! @Example
G := SmallGroup( 12, 1 );; StructureDescription( G );; G;
#! C3 : C4
CentralCharacters( G, 2 );
#! [ [ Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2) ],
#!   [ Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0 ] ]
#! @EndExample
