#! @System DecompositionMatricesOfBlocks

#! @Example
ordtbl := CharacterTable( "A5" );
#! CharacterTable( "A5" )
DecompositionMatricesOfBlocks( ordtbl mod 2 );
#! [ [ [ 1, 0, 0 ], [ 1, 0, 1 ], [ 1, 1, 0 ], [ 1, 1, 1 ] ],
#!   [ [ 1 ] ] ]
#! @EndExample
