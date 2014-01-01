#! @System NrCentralInvolutions

LoadPackage( "Blocks" );

#! @Example
L := [ 
       "2.A5", "2.A6", "2.A7",
       "2.A8",
       "2.A9", "2.A10", "2.A11", "2.A12", "2.A13" ];;
List( L, G -> NrCentralInvolutions( CharacterTable( G ) ) );
#! [ 1, 1, 1, 1, 1, 1, 1, 1, 1 ]
#! @EndExample
