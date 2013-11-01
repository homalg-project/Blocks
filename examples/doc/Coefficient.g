#! @System Coefficient

#! @Example
G := SmallGroup( 20, 1 );; StructureDescription( G );; G;
#! C5 : C4
g := GeneratorsOfMagmaWithInverses( G )[3];
#! f3
Order( g );
#! 5
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
Coefficient( e[1], g );
#! Z(2)^0
Coefficient( e[1], g^G );
#! Z(2)^0
Coefficient( e[2], g );
#! Z(2^2)
Coefficient( e[2], g^G );
#! Z(2^2)
Coefficient( e[3], g );
#! Z(2^2)^2
Coefficient( e[3], g^G );
#! Z(2^2)^2
#! @EndExample
