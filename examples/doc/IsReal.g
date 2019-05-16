#! @Chunk IsReal:cc

LoadPackage( "Blocks" );

#! @Example
G := SmallGroup( 12, 1 );; StructureDescription( G );; G;
#! C3 : C4
g := GeneratorsOfMagmaWithInverses( G )[3];
#! f3
Order( g );
#! 3
K := g^G;
#! f3^G
Involution( K );
#! f3^2^G
(g^-1)^G;
#! f3^2^G
Involution( K ) = K;
#! true
IsReal( K );
#! true
h := GeneratorsOfMagmaWithInverses( G )[1];
#! f1
Order( h );
#! 4
IsReal( h^G );
#! false
#! @EndExample
