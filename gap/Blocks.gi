#############################################################################
##
##  Blocks.gi                                                 Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Implementation stuff for blocks.
##
#############################################################################

##
InstallMethod( DefectsOfBlocks,
        [ IsCharacterTable, IsInt ],
        
  function( ordtbl, p )
    local blocks;
    
    blocks := BlocksInfo( ordtbl mod p );
    
    return List( blocks, b -> b.defect );
    
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
    local blocks;
    
    blocks := BlocksInfo( ordtbl mod p );
    
    return List( blocks, b -> List( Irr( ordtbl ){b.ordchars}, Degree ) );
    
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
    local modtbl, blocks;
    
    modtbl := ordtbl mod p;
    
    blocks := BlocksInfo( modtbl );
    
    return List( blocks, b -> List( Irr( modtbl ){b.modchars}, Degree ) );
    
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
    local modtbl, blocks, decmats;
    
    modtbl := ordtbl mod p;
    
    blocks := BlocksInfo( modtbl );
    
    decmats := List( [ 1 .. Length( blocks ) ], i -> DecompositionMatrix( modtbl, i ) );
    
    return List( decmats, decmat -> TransposedMat( decmat ) * decmat );
    
end );

##
InstallMethod( CartanMatricesOfBlocks,
        [ IsGroup, IsInt ],
        
  function( G, p )
    
    return CartanMatricesOfBlocks( CharacterTable( G ), p );
    
end );
