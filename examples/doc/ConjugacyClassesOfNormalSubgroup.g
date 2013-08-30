##  <#GAPDoc Label="ConjugacyClassesOfNormalSubgroup">
##  <Example><![CDATA[
##  gap> G := SmallGroup( 12, 1 );; StructureDescription( G );; G;
##  C3 : C4
##  gap> G0 := SerreCharacteristicSubgroup( G );;
##  gap> StructureDescription( G0 );; G0;
##  C6
##  gap> KK := ConjugacyClassesOfNormalSubgroup( G0 );
##  [ <identity> of ...^G, f2^G, f3^G, f2*f3^G ]
##  gap> List( KK, Size );
##  [ 1, 1, 2, 2 ]
##  gap> List( KK, K -> Order( Representative( K ) ) );
##  [ 1, 2, 3, 6 ]
##  ]]></Example>
##  <#/GAPDoc>

LoadPackage( "Blocks" );

G := SmallGroup( 12, 1 );; StructureDescription( G );; G;
G0 := SerreCharacteristicSubgroup( G );
Assert( 0, StructureDescription( G0 ) = "C6" );
KK := ConjugacyClassesOfNormalSubgroup( G0 );
Assert( 0, List( KK, Size ) = [ 1, 1, 2, 2 ] );
Assert( 0, List( KK, K -> Order( Representative( K ) ) ) = [ 1, 2, 3, 6 ] );
