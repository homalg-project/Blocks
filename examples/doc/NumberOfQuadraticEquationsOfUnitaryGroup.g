##  <#GAPDoc Label="NumberOfQuadraticEquationsOfUnitaryGroup">
##  <Example><![CDATA[
##  gap> G := SmallGroup( 28, 1 );; StructureDescription( G );; G;
##  C7 : C4
##  gap> kG := GroupRing( GF(2), G );
##  <algebra-with-one over GF(2), with 3 generators>
##  gap> NumberOfQuadraticEquationsOfUnitaryGroup( kG );
##  13
##  ]]></Example>
##  <#/GAPDoc>

LoadPackage( "Blocks" );

G := SmallGroup( 28, 1 );; StructureDescription( G );; G;
kG := GroupRing( GF(2), G );
Assert( 0, NumberOfQuadraticEquationsOfUnitaryGroup( kG ) = 13 );
