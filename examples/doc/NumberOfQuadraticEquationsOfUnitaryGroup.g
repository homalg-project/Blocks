##  <#GAPDoc Label="NumberOfQuadraticEquationsOfUnitaryGroup">
##  <Example><![CDATA[
##  gap> G := SmallGroup( 28, 1 );; StructureDescription( G );; G;
##  C7 : C4
##  gap> NumberOfQuadraticEquationsOfUnitaryGroup( G );
##  13
##  ]]></Example>
##  <#/GAPDoc>

LoadPackage( "Blocks" );

G := SmallGroup( 28, 1 );; StructureDescription( G );; G;
Assert( 0, NumberOfQuadraticEquationsOfUnitaryGroup( G ) = 13 );
