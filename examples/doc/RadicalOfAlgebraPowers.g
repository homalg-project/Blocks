#! @System RadicalOfAlgebraPowers

#! @Example
G := SmallGroup( 12, 1 );; StructureDescription( G );; G;
#! C3 : C4
k := GF(2);
#! GF(2)
A := GroupRing( k, G );
#! <algebra-with-one over GF(2), with 3 generators>
rad := RadicalOfAlgebraPowers( A );
#! rec( 0 := <algebra-with-one of dimension 12 over GF(2)>, 
#!      1 := <two-sided ideal in <algebra-with-one of dimension 12 over GF(2)>,
#!           (dimension 7)>, 
#!      2 := <two-sided ideal in <algebra-with-one of dimension 12 over GF(2)>,
#!           (dimension 2)>, 
#!      3 := <two-sided ideal in <algebra-with-one of dimension 12 over GF(2)>,
#!           (dimension 1)>, 
#!      4 := <two-sided ideal in <algebra-with-one of dimension 12 over GF(2)>,
#!           (dimension 0)> )
#! @EndExample
