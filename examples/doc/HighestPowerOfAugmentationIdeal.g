##  <#GAPDoc Label="HighestPowerOfAugmentationIdeal">
##  <Example><![CDATA[
##  gap> G := SmallGroup( 12, 1 );; StructureDescription( G );; G;
##  C3 : C4
##  gap> k := GF(2);
##  GF(2)
##  gap> A := GroupRing( k, G );
##  <algebra-with-one over GF(2), with 3 generators>
##  gap> HighestPowerOfAugmentationIdeal( A );
##  <two-sided ideal in <algebra-with-one of dimension 12 over GF(2)>, 
##    (dimension 8)>
##  ]]></Example>
##  <#/GAPDoc>

LoadPackage( "Blocks" );

G := SmallGroup( 12, 1 );; StructureDescription( G );; G;
k := GF(2);
A := GroupRing( k, G );
Assert( 0, Dimension( HighestPowerOfAugmentationIdeal( A ) ) = 8 );
