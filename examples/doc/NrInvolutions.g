#! @System NrInvolutions

LoadPackage( "Blocks" );

#! @Example
L := [ 
       "2.A5", "2.A6", "2.A7",
       "2.A8",
       "2.A9", "2.A10", "2.A11", "2.A12", "2.A13" ];;
List( L, G -> NrInvolutions( CharacterTable( G ) ) );
#! [ 1, 1, 1, 211, 1891, 9451, 34651, 103951, 270271 ]
List( [ "2.L2(3)", "2.L2(5)", "2.L2(7)", "2.L2(9)", "2.L2(11)" ],
      G -> NrInvolutions( CharacterTable( G ) ) );
#! [ 1, 1, 1, 1, 1 ]
#! @EndExample
