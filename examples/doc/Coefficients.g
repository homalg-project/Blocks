#! @System Coefficients

LoadPackage( "Blocks" );

#! @Example
G := SmallGroup( 20, 1 );; StructureDescription( G );; G;
#! C5 : C4
k := GF(2^2);
#! GF(2^2)
A := GroupRing( k, G );
#! <algebra-with-one over GF(2^2), with 3 generators>
e := CentralIdempotentsOfInvolutiveAlgebra( A );
#! [ (Z(2)^0)*<identity> of ...+(Z(2)^0)*f3+(Z(2)^0)*f3^2+(Z(2)^0)*f3^3+(Z(2)^0)*f3^4,
#!   (Z(2^2))*f3+(Z(2^2)^2)*f3^2+(Z(2^2)^2)*f3^3+(Z(2^2))*f3^4,
#!   (Z(2^2)^2)*f3+(Z(2^2))*f3^2+(Z(2^2))*f3^3+(Z(2^2)^2)*f3^4 ]
Length( e );
#! 3
Coefficients( e[1] );
#! [ Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2) ]
Coefficients( e[2] );
#! [ 0*Z(2), 0*Z(2), 0*Z(2), Z(2^2), 0*Z(2), 0*Z(2), Z(2^2)^2, 0*Z(2) ]
Coefficients( e[3] );
#! [ 0*Z(2), 0*Z(2), 0*Z(2), Z(2^2)^2, 0*Z(2), 0*Z(2), Z(2^2), 0*Z(2) ]
#! @EndExample
