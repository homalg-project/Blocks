#! @System NumberOfQuadraticEquationsOfUnitaryGroup

LoadPackage( "Blocks" );

#! @Example
G := SmallGroup( 28, 1 );; StructureDescription( G );; G;
#! C7 : C4
kG := GroupRing( GF(2), G );
#! <algebra-with-one over GF(2), with 3 generators>
NumberOfQuadraticEquationsOfUnitaryGroup( kG );
#! 13
#! @EndExample
