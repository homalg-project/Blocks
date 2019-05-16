#! @Chunk ConjugacyClassesOfNormalSubgroup

LoadPackage( "Blocks" );

#! @Example
G := SmallGroup( 12, 1 );; StructureDescription( G );; G;
#! C3 : C4
G0 := SerreCharacteristicSubgroup( G );;
StructureDescription( G0 );; G0;
#! C6
KK := ConjugacyClassesOfNormalSubgroup( G0 );
#! [ <identity> of ...^G, f2^G, f3^G, f2*f3^G ]
List( KK, Size );
#! [ 1, 1, 2, 2 ]
List( KK, K -> Order( Representative( K ) ) );
#! [ 1, 2, 3, 6 ]
#! @EndExample
