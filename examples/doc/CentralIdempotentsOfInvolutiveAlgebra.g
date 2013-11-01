#! @System CentralIdempotentsOfInvolutiveAlgebra

#! @Example
G := CyclicGroup( 6 );; StructureDescription( G );; G;
#! C6
k := GF(2^2);
#! GF(2^2)
A := GroupRing( k, G );
#! <algebra-with-one over GF(2^2), with 2 generators>
b := CentralIdempotentsOfAlgebra( A );
#! [ (Z(2)^0)*<identity> of ...+(Z(2)^0)*f2+(Z(2)^0)*f2^2, 
#!   (Z(2)^0)*<identity> of ...+(Z(2^2))*f2+(Z(2^2)^2)*f2^2, 
#!   (Z(2)^0)*<identity> of ...+(Z(2^2)^2)*f2+(Z(2^2))*f2^2 ]
Length( b );
#! 3
e := CentralIdempotentsOfInvolutiveAlgebra( A );
#! [ (Z(2)^0)*<identity> of ...+(Z(2)^0)*f2+(Z(2)^0)*f2^2,
#!   (Z(2)^0)*f2+(Z(2)^0)*f2^2 ]
Length( e );
#! 2
#! @EndExample
