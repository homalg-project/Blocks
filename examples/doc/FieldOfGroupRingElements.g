#! @Chunk FieldOfGroupRingElements

LoadPackage( "Blocks" );

#! @Example
G := CyclicGroup( 6 );; StructureDescription( G );; G;
#! C6
k := GF(2^2);
#! GF(2^2)
A := GroupRing( k, G );
#! <algebra-with-one over GF(2^2), with 2 generators>
e := CentralIdempotentsOfInvolutiveAlgebra( A );
#! [ (Z(2)^0)*<identity> of ...+(Z(2)^0)*f2+(Z(2)^0)*f2^2,
#!   (Z(2)^0)*f2+(Z(2)^0)*f2^2 ]
FieldOfGroupRingElements( e );
#! GF(2)
#! @EndExample
