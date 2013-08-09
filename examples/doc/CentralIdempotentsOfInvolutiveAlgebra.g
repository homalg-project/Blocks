##  <#GAPDoc Label="CentralIdempotentsOfInvolutiveAlgebra">
##  <Example><![CDATA[
##  gap> G := CyclicGroup( 6 );; StructureDescription( G );; G;
##  C6
##  gap> k := GF(2^2);
##  GF(2^2)
##  gap> A := GroupRing( k, G );
##  <algebra-with-one over GF(2^2), with 2 generators>
##  gap> b := CentralIdempotentsOfAlgebra( A );
##  [ (Z(2)^0)*<identity> of ...+(Z(2)^0)*f2+(Z(2)^0)*f2^2, 
##    (Z(2)^0)*<identity> of ...+(Z(2^2))*f2+(Z(2^2)^2)*f2^2, 
##    (Z(2)^0)*<identity> of ...+(Z(2^2)^2)*f2+(Z(2^2))*f2^2 ]
##  gap> Length( b );
##  3
##  gap> e := CentralIdempotentsOfInvolutiveAlgebra( A );
##  [ (Z(2)^0)*<identity> of ...+(Z(2)^0)*f2+(Z(2)^0)*f2^2,
##    (Z(2)^0)*f2+(Z(2)^0)*f2^2 ]
##  gap> Length( e );
##  2
##  ]]></Example>
##  <#/GAPDoc>

LoadPackage( "Blocks" );

G := CyclicGroup( 6 );; StructureDescription( G );; G;
k := GF(2^2);
A := GroupRing( k, G );
b := CentralIdempotentsOfAlgebra( A );
Assert( 0, Length( b ) = 3 );
e := CentralIdempotentsOfInvolutiveAlgebra( A );
Assert( 0, Length( e ) = 2 );
