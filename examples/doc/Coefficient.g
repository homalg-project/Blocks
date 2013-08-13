##  <#GAPDoc Label="Coefficient">
##  <Example><![CDATA[
##  gap> G := SmallGroup( 20, 1 );; StructureDescription( G );; G;
##  C5 : C4
##  gap> g := GeneratorsOfMagmaWithInverses( G )[3];
##  f3
##  gap> Order( g );
##  5
##  gap> k := GF(2^2);
##  GF(2^2)
##  gap> A := GroupRing( k, G );
##  <algebra-with-one over GF(2^2), with 3 generators>
##  gap> e := CentralIdempotentsOfInvolutiveAlgebra( A );
##  [ (Z(2)^0)*<identity> of ...+(Z(2)^0)*f3+(Z(2)^0)*f3^2+(Z(2)^0)*f3^3+(Z(2)^0)*f3^4,
##    (Z(2^2))*f3+(Z(2^2)^2)*f3^2+(Z(2^2)^2)*f3^3+(Z(2^2))*f3^4,
##    (Z(2^2)^2)*f3+(Z(2^2))*f3^2+(Z(2^2))*f3^3+(Z(2^2)^2)*f3^4 ]
##  gap> Length( e );
##  3
##  gap> Coefficient( e[1], g );
##  Z(2)^0
##  gap> Coefficient( e[1], g^G );
##  Z(2)^0
##  gap> Coefficient( e[2], g );
##  Z(2^2)
##  gap> Coefficient( e[2], g^G );
##  Z(2^2)
##  gap> Coefficient( e[3], g );
##  Z(2^2)^2
##  gap> Coefficient( e[3], g^G );
##  Z(2^2)^2
##  ]]></Example>
##  <#/GAPDoc>

LoadPackage( "Blocks" );

G := SmallGroup( 20, 1 );; StructureDescription( G );; G;
k := GF(2^2);
A := GroupRing( k, G );
e := CentralIdempotentsOfInvolutiveAlgebra( A );
Assert( 0, Length( e ) = 3 );
