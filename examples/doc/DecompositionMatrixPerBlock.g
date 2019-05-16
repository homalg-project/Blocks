#! @Chunk DecompositionMatrixPerBlock

LoadPackage( "Blocks" );

#! @Example
ordtbl := CharacterTable( "A5" );
#! CharacterTable( "A5" )
DecompositionMatrixPerBlock( ordtbl mod 2 );
#! [ [ [ 1, 0, 0 ], [ 1, 0, 1 ], [ 1, 1, 0 ], [ 1, 1, 1 ] ],
#!   [ [ 1 ] ] ]
#! @EndExample
