#! @System HighestPowerOfAugmentationIdeal

#! @Example
G := SmallGroup( 12, 1 );; StructureDescription( G );; G;
#! C3 : C4
k := GF(2);
#! GF(2)
A := GroupRing( k, G );
#! <algebra-with-one over GF(2), with 3 generators>
HighestPowerOfAugmentationIdeal( A );
#! <two-sided ideal in <algebra-with-one of dimension 12 over GF(2)>, (dimension 8)>
#! @EndExample
