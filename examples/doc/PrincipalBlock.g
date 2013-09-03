##  <#GAPDoc Label="PrincipalBlock">
##  <Example><![CDATA[
##  gap> G := SmallGroup( 12, 1 );; StructureDescription( G );; G;
##  C3 : C4
##  gap> kG := GroupRing( GF(2), G );
##  <algebra-with-one over GF(2), with 3 generators>
##  gap> b0 := PrincipalBlockIdempotent( kG );
##  (Z(2)^0)*<identity> of ...+(Z(2)^0)*f3+(Z(2)^0)*f3^2
##  gap> B0 := PrincipalBlock( kG );
##  <two-sided ideal in <algebra-with-one over GF(2), with 3 generators>,
##   (1 generators)>
##  gap> One( B0 ) = b0;
##  true
##  gap> Dimension( B0 );
##  4
##  ]]></Example>
##  <#/GAPDoc>

LoadPackage( "Blocks" );

G := SmallGroup( 12, 1 );; StructureDescription( G );; G;
kG := GroupRing( GF(2), G );
b0 := PrincipalBlockIdempotent( kG );
B0 := PrincipalBlock( kG );
Assert( 0, One( B0 ) = b0 );
Assert( 0, Dimension( B0 ) = 4 );
