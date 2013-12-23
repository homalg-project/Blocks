#! @System IsRegular

LoadPackage( "Blocks" );

#! @Example
G := SmallGroup( 12, 1 );; StructureDescription( G );; G;
#! C3 : C4
g := GeneratorsOfMagmaWithInverses( G )[3];
#! f3
Order( g );
#! 3
IsRegular( g, 2 );
#! true
IsRegular( g^G, 2 );
#! true
h := GeneratorsOfMagmaWithInverses( G )[1];
#! f1
Order( h );
#! 4
IsRegular( h, 2 );
#! false
IsRegular( h^G, 2 );
#! false
#! @EndExample
