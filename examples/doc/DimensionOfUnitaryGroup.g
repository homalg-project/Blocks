##  <#GAPDoc Label="DimensionOfUnitaryGroup">
##  <Example><![CDATA[
##  gap> G := SmallGroup( 28, 1 );; StructureDescription( G );; G;
##  C7 : C4
##  gap> DimensionOfUnitaryGroup( G );
##  14
##  ]]></Example>
##  <#/GAPDoc>

LoadPackage( "Blocks" );

G := SmallGroup( 28, 1 );; StructureDescription( G );; G;
Assert( 0, DimensionOfUnitaryGroup( G ) = 14 );
