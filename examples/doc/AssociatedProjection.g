#! @System AssociatedProjection

LoadPackage( "Blocks" );

#! @Example
G := SmallGroup( 12, 1 );; StructureDescription( G );; G;
#! C3 : C4
kG := GroupRing( GF(2), G );
#! <algebra-with-one over GF(2), with 3 generators>
k := HomalgRingOfIntegersInSingular( 2 );
#! GF(2)
SetCoefficientsRingForPolynomialAlgebra( kG, k );
B0 := PrincipalBlock( kG );
#! <two-sided ideal in <algebra-with-one over GF(2), with 3 generators>,
#!  (dimension 4)>
M0 := UnderlyingModule( B0 );
#! <A free left module of rank 4 on free generators>
pi := AssociatedProjection( M0 );
#! <A homomorphism of left modules>
Display( pi );
#! 1,0,0,0,
#! 0,1,0,0,
#! 0,0,1,0,
#! 1,0,0,0,
#! 0,0,0,1,
#! 0,1,0,0,
#! 0,0,1,0,
#! 1,0,0,0,
#! 0,0,0,1,
#! 0,1,0,0,
#! 0,0,1,0,
#! 0,0,0,1
#! 
#! the map is currently represented by the above 12 x 4 matrix
#! @EndExample
