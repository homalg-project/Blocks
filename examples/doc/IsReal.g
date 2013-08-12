##  <#GAPDoc Label="IsReal:cc">
##  <Example><![CDATA[
##  gap> G := SmallGroup( 12, 1 );; StructureDescription( G );; G;
##  C3 : C4
##  gap> g := GeneratorsOfMagmaWithInverses( G )[3];
##  f3
##  gap> Order( g );
##  3
##  gap> K := g^G;
##  f3^G
##  gap> Involution( K );
##  f3^2^G
##  gap> (g^-1)^G;
##  f3^2^G
##  gap> Involution( K ) = K;
##  true
##  gap> IsReal( K );
##  true
##  gap> h := GeneratorsOfMagmaWithInverses( G )[1];
##  f1
##  gap> Order( h );
##  4
##  gap> IsReal( h^G );
##  false
##  ]]></Example>
##  <#/GAPDoc>

LoadPackage( "Blocks" );

G := SmallGroup( 12, 1 );; StructureDescription( G );; G;
g := GeneratorsOfMagmaWithInverses( G )[3];
Assert( 0, Order( g ) = 3 );
Assert( 0, IsReal( g^G ) );
h := GeneratorsOfMagmaWithInverses( G )[1];
Assert( 0, Order( h ) = 4 );
Assert( 0, not IsReal( h^G ) );
