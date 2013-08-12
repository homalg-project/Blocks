##  <#GAPDoc Label="IsRegular">
##  <Example><![CDATA[
##  gap> G := SmallGroup( 12, 1 );; StructureDescription( G );; G;
##  C3 : C4
##  gap> g := GeneratorsOfMagmaWithInverses( G )[3];
##  f3
##  gap> Order( g );
##  3
##  gap> IsRegular( g, 2 );
##  true
##  gap> IsRegular( g^G, 2 );
##  true
##  gap> h := GeneratorsOfMagmaWithInverses( G )[1];
##  f1
##  gap> Order( h );
##  4
##  gap> IsRegular( h, 2 );
##  false
##  gap> IsRegular( h^G, 2 );
##  false
##  ]]></Example>
##  <#/GAPDoc>

LoadPackage( "Blocks" );

G := SmallGroup( 12, 1 );; StructureDescription( G );; G;
g := GeneratorsOfMagmaWithInverses( G )[3];
Assert( 0, Order( g ) = 3 );
Assert( 0, IsRegular( g^G ) );
h := GeneratorsOfMagmaWithInverses( G )[1];
Assert( 0, Order( h ) = 4 );
Assert( 0, not IsRegular( h^G ) );
