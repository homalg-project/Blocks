#! @Chunk DefectGroup:cc

LoadPackage( "Blocks" );

#! @Example
G := SmallGroup( 12, 1 );; StructureDescription( G );; G;
#! C3 : C4
g := GeneratorsOfMagmaWithInverses( G )[3];
#! f3
Order( g );
#! 3
D := DefectGroup( g^G, 2 );;
StructureDescription( D );; D;
#! C2
#! @EndExample
