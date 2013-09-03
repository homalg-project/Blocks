##  <#GAPDoc Label="AssociatedProjection">
##  <Example><![CDATA[
##  gap> G := SmallGroup( 12, 1 );; StructureDescription( G );; G;
##  C3 : C4
##  gap> kG := GroupRing( GF(2), G );
##  <algebra-with-one over GF(2), with 3 generators>
##  gap> B0 := PrincipalBlock( kG );
##  <two-sided ideal in <algebra-with-one over GF(2), with 3 generators>,
##   (1 generators)>
##  gap> k := HomalgRingOfIntegersInSingular( 2 );
##  GF(2)
##  gap> M0 := UnderlyingModule( k, B0 );
##  <A free left module of rank 4 on free generators>
##  gap> pi := AssociatedProjection( M0 );
##  <A homomorphism of left modules>
##  gap> Display( last );
##  1,0,0,0,
##  0,1,0,0,
##  0,0,1,0,
##  1,0,0,0,
##  0,0,0,1,
##  0,1,0,0,
##  0,0,1,0,
##  1,0,0,0,
##  0,0,0,1,
##  0,1,0,0,
##  0,0,1,0,
##  0,0,0,1
##  
##  the map is currently represented by the above 12 x 4 matrix
##  ]]></Example>
##  <#/GAPDoc>

LoadPackage( "Blocks" );

G := SmallGroup( 12, 1 );; StructureDescription( G );; G;
kG := GroupRing( GF(2), G );
B0 := PrincipalBlock( kG );
k := HomalgRingOfIntegersInSingular( 2 );
M0 := UnderlyingModule( k, B0 );
pi := AssociatedProjection( M0 );
