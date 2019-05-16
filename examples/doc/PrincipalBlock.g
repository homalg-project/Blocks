#! @Chunk PrincipalBlock

LoadPackage( "Blocks" );

#! @Example
G := SmallGroup( 12, 1 );; StructureDescription( G );; G;
#! C3 : C4
kG := GroupRing( GF(2), G );
#! <algebra-with-one over GF(2), with 3 generators>
b0 := PrincipalBlockIdempotent( kG );
#! (Z(2)^0)*<identity> of ...+(Z(2)^0)*f3+(Z(2)^0)*f3^2
B0 := PrincipalBlock( kG );
#! <two-sided ideal in <algebra-with-one over GF(2), with 3 generators>,
#!  (dimension 4)>
One( B0 ) = b0;
#! true
Dimension( B0 );
#! 4
#! @EndExample
