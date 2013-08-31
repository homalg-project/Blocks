#############################################################################
##
##  Blocks.gi                                                 Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Implementation stuff for blocks.
##
#############################################################################

####################################
#
# methods for attributes:
#
####################################

##
InstallMethod( DefectsOfBlocks,
        [ IsBrauerTable ],
        
  function( modtbl )
    local blocks;
    
    blocks := BlocksInfo( modtbl );
    
    return List( blocks, b -> b.defect );
    
end );

##
InstallMethod( CharacterDegreesOfBlocks,
        [ IsBrauerTable ],
        
  function( modtbl )
    local ordtbl, blocks;
    
    ordtbl := OrdinaryCharacterTable( modtbl );
    
    blocks := BlocksInfo( modtbl );
    
    return List( blocks, b -> List( Irr( ordtbl ){b.ordchars}, Degree ) );
    
end );

##
InstallMethod( BrauerCharacterDegreesOfBlocks,
        [ IsBrauerTable ],
        
  function( modtbl )
    local blocks;
    
    blocks := BlocksInfo( modtbl );
    
    return List( blocks, b -> List( Irr( modtbl ){b.modchars}, Degree ) );
    
end );

##
InstallMethod( CartanMatricesOfBlocks,
        [ IsBrauerTable ],
        
  function( modtbl )
    local blocks, decmats;
    
    blocks := BlocksInfo( modtbl );
    
    decmats := List( [ 1 .. Length( blocks ) ], i -> DecompositionMatrix( modtbl, i ) );
    
    return List( decmats, decmat -> TransposedMat( decmat ) * decmat );
    
end );

## the notion is used in [RG] and the algorithm in [GM00]
InstallMethod( CentralCharactersOfBlocks,
        [ IsBrauerTable ],
        
  function( modtbl )
    local ordtbl, blocks, omegas;
    
    ordtbl := OrdinaryCharacterTable( modtbl );
    
    blocks := BlocksInfo( modtbl );
    
    ## for each block B compute the central character omega_chi,
    ## where chi is some ordinary character belonging to B
    omegas := List( blocks,
                    B -> CentralCharacter( Irr( ordtbl )[B.ordchars[1]] ) );
    
    ## for each block B compute its central character omega
    omegas := List( omegas,
                    o -> List( o, b -> FrobeniusCharacterValue( b, 2 ) ) );
    
    Perform( [ 1 .. Length( blocks ) ],
            function( i )
              blocks[i]!.CentralCharacterOfBlock := omegas[i];
            end );
    
    return omegas;
    
end );

##
InstallMethod( BlockIdempotentInfo,
        [ IsElementOfFreeMagmaRing ],
        
  function( b )
    local modtbl, omegas, coeffs, prod, pos, block;
    
    modtbl := UnderlyingBrauerTable( b );
    
    omegas := CentralCharactersOfBlocks( modtbl );
    
    coeffs := Coefficients( b );
    
    prod := List( omegas, omega -> Sum( ListN( omega, coeffs, \* ) ) );
    
    pos := PositionProperty( prod, a -> not IsZero( a ) );
    
    Assert( 0, IsOne( prod[pos] ) );
    Assert( 0, PositionProperty( prod, a -> not IsZero( a ), pos + 1 ) = fail );
    
    block := BlocksInfo( modtbl )[pos];
    
    block!.BlockIdempotent := b;
    
    return block;
    
end );

####################################
#
# methods for operations:
#
####################################

##
InstallMethod( DefectsOfBlocks,
        [ IsCharacterTable, IsInt ],
        
  function( ordtbl, p )
    
    return DefectsOfBlocks( ordtbl mod p );
    
end );

##
InstallMethod( DefectsOfBlocks,
        [ IsGroup, IsInt ],
        
  function( G, p )
    
    return DefectsOfBlocks( CharacterTable( G ), p );
    
end );

##
InstallMethod( CharacterDegreesOfBlocks,
        [ IsCharacterTable, IsInt ],
        
  function( ordtbl, p )
    
    return CharacterDegreesOfBlocks( ordtbl mod p );
    
end );

##
InstallMethod( CharacterDegreesOfBlocks,
        [ IsGroup, IsInt ],
        
  function( G, p )
    
    return CharacterDegreesOfBlocks( CharacterTable( G ), p );
    
end );

##
InstallMethod( BrauerCharacterDegreesOfBlocks,
        [ IsCharacterTable, IsInt ],
        
  function( ordtbl, p )
    
    return BrauerCharacterDegreesOfBlocks( ordtbl mod p );
    
end );

##
InstallMethod( BrauerCharacterDegreesOfBlocks,
        [ IsGroup, IsInt ],
        
  function( G, p )
    
    return BrauerCharacterDegreesOfBlocks( CharacterTable( G ), p );
    
end );

##
InstallMethod( CartanMatricesOfBlocks,
        [ IsCharacterTable, IsInt ],
        
  function( ordtbl, p )
    
    return CartanMatricesOfBlocks( ordtbl mod p );
    
end );

##
InstallMethod( CartanMatricesOfBlocks,
        [ IsGroup, IsInt ],
        
  function( G, p )
    
    return CartanMatricesOfBlocks( CharacterTable( G ), p );
    
end );

##
InstallMethod( CentralCharactersOfBlocks,
        [ IsCharacterTable, IsInt ],
        
  function( ordtbl, p )
    
    return CentralCharactersOfBlocks( ordtbl mod p );
    
end );

##
InstallMethod( CentralCharactersOfBlocks,
        [ IsGroup, IsInt ],
        
  function( G, p )
    
    return CentralCharactersOfBlocks( CharacterTable( G ), p );
    
end );
