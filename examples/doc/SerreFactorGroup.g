##  <#GAPDoc Label="SerreFactorGroup">
##  <Example><![CDATA[
##  gap> G := SmallGroup( 28, 1 );; StructureDescription( G );; G;
##  C7 : C4
##  gap> S := SerreFactorGroup( G );;
##  gap> StructureDescription( S );; S;
##  C2
##  ]]></Example>
##  <#/GAPDoc>

LoadPackage( "Blocks" );

G := SmallGroup( 28, 1 );; StructureDescription( G );; G;
S := SerreFactorGroup( G );
Assert( 0, StructureDescription( S ) = "C2" );
