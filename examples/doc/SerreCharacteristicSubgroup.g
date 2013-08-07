##  <#GAPDoc Label="SerreCharacteristicSubgroup">
##  <Example><![CDATA[
##  gap> G := SmallGroup( 28, 1 );; StructureDescription( G );; G;
##  C7 : C4
##  gap> G0 := SerreCharacteristicSubgroup( G );;
##  gap> StructureDescription( G0 );; G0;
##  C14
##  ]]></Example>
##  <#/GAPDoc>

LoadPackage( "Blocks" );

G := SmallGroup( 28, 1 );; StructureDescription( G );; G;
G0 := SerreCharacteristicSubgroup( G );
Assert( 0, StructureDescription( G0 ) = "C14" );
