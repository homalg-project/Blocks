##  <#GAPDoc Label="DefectGroup:cc">
##  <Example><![CDATA[
##  gap> G := SmallGroup( 12, 1 );; StructureDescription( G );; G;
##  C3 : C4
##  gap> g := GeneratorsOfMagmaWithInverses( G )[3];
##  f3
##  gap> Order( g );
##  3
##  gap> D := DefectGroup( g^G, 2 );;
##  gap> StructureDescription( D );; D;
##  C2
##  ]]></Example>
##  <#/GAPDoc>

LoadPackage( "Blocks" );

G := SmallGroup( 12, 1 );; StructureDescription( G );; G;
g := GeneratorsOfMagmaWithInverses( G )[3];
Assert( 0, Order( g ) = 3 );
D := DefectGroup( g^G, 2 );
Assert( 0, StructureDescription( D ) = "C2" );
