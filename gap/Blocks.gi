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
# methods for properties:
#
####################################

##
InstallMethod( IsBlock,
        [ IsAlgebra and HasOne ],
        
  function( B )
    local b;
    
    b := One( B );
    
    if IsBound( b![999] ) and b![999] = false then
        return false;
    fi;
    
    TryNextMethod( );
    
end );

##
InstallMethod( IsReal,
        [ IsAlgebra and HasOne and IsBlock ],
        
  function( B )
    local b;
    
    b := One( B );
    
    if not b = Involution( b ) then
        return false;
    fi;
    
    TryNextMethod( );
    
end );

####################################
#
# methods for attributes:
#
####################################

##
InstallMethod( PrincipalBlockIdempotent,
        [ IsGroupAlgebra ],
        
  function( kG )
    local e, b0;
    
    ## CentralIdempotentsOfAlgebra does not store kG in the e's
    e := CentralIdempotentsOfInvolutiveAlgebra( kG );
    
    b0 := First( e, b -> IsOne( Sum( CoefficientsBySupport( b ) ) ) );
    
    ## FIXME: undocumented, figure out how to add a `component' to IsMagmaRingObjDefaultRep
    ## see UnderlyingGroupAlgebra
    b0![1001] := kG;
    
    return b0;
    
end );

##
InstallMethod( PrincipalBlock,
        [ IsGroupAlgebra ],
        
  function( kG )
    local b0, B0;
    
    b0 := PrincipalBlockIdempotent( kG );
    
    B0 := TwoSidedIdeal( kG, [ b0 ] );
    
    SetOne( B0, b0 );
    SetIsBlock( B0, true );
    SetIsReal( B0, true );
    
    return B0;
    
end );

##
InstallMethod( AssociatedProjectionMatrix,
        [ IsAlgebra and HasOne ],
        
  function( B )
    local kG, G, b, bas, proj, k, c, d;
    
    kG := UnderlyingGroupAlgebra( B );
    
    G := UnderlyingMagma( kG );
    
    b := One( B );
    
    bas := Basis( B );
    
    proj := List( G, g -> b * g );
    
    return List( proj, a -> Coefficients( bas, a ) );
    
end );

##
InstallMethod( AssociatedProjection,
        [ IsHomalgModule ],
        
  function( M )
    local G, b, proj, mat, R, k, kG;
    
    if not IsBound( M!.GroupAlgebra ) then
        TryNextMethod( );
    fi;
    
    G := Basis( M!.GroupAlgebra );
    
    b := M!.UnitOfAlgebraicGroup;
    
    b := AsElementOfAlgebra( b );
    
    proj := List( G, g -> b * g );
    
    mat := List( proj, a -> Coefficients( M, a ) );
    
    R := HomalgRing( M );
    
    mat := HomalgMatrix( mat, R );
    
    kG := UnderlyingGroupAlgebra( M!.UnderlyingAlgebra );
    
    kG := Dimension( kG ) * R;
    
    return HomalgMap( mat, kG, M );
    
end );

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

##
InstallMethod( DefectClasses,
        [ IsElementOfFreeMagmaRing ],
        
  function( b )
    local modtbl, ordtbl, classes, block, omega, pos;
    
    modtbl := UnderlyingBrauerTable( b );
    
    ordtbl := OrdinaryCharacterTable( modtbl );
    
    classes := ConjugacyClasses( ordtbl );
    
    CentralCharactersOfBlocks( modtbl );
    
    block := BlockIdempotentInfo( b );
    
    omega := block!.CentralCharacterOfBlock;
    
    pos := Filtered( [ 1 .. Length( classes ) ],
                   function( K )
                     if IsZero( omega[K] ) or
                        IsZero( Coefficient( b, classes[K] ) ) then
                         return false;
                     fi;
                     return true;
                   end );
    
    classes := classes{pos};
    
    block!.DefectClassesOfBlock := classes;
    
    return classes;
    
end );

##
InstallMethod( DefectGroup,
        [ IsElementOfFreeMagmaRing ],
        
  function( b )
    local kG, p, classes, K;
    
    kG := UnderlyingGroupAlgebra( b );
    
    p := Characteristic( kG );
    
    classes := DefectClasses( b );
    
    K := classes[1];
    
    return DefectGroup( K, p );
    
end );

##
InstallMethod( DefectGroup,
        [ IsAlgebra and HasOne ],
        
  function( B )
    
    return DefectGroup( One( B ) );
    
end );

####################################
#
# methods for operations:
#
####################################

##
InstallMethod( CorrespondingMaximalIdeal,
        [ IsMultiplicativeElementWithInverse, IsHomalgModule ],
        
  function( g, M )
    local b, m;
    
    if not IsBound( M!.UnitOfAlgebra ) then
        Error( "component `UnitOfAlgebra' unbound\n" );
    fi;
    
    b := M!.UnitOfAlgebra;
    
    g := Coefficients( M, Coerce( One( M!.GroupAlgebra ), b ) * g );
    
    if g = fail then
        return fail;
    fi;
    
    m := GeneralElement( M );
    m := UnderlyingMorphism( m );
    m := MatrixOfMap( m );
    m := EntriesOfHomalgMatrix( m );
    
    return LeftSubmodule( m - g );
    
end );

##
InstallMethod( CorrespondingMaximalIdeal,
        [ IsMultiplicativeElementWithInverse, IsHomalgFiltration ],
        
  function( g, filt )
    local M, b, N, n;
    
    M := UnderlyingObject( filt );
    
    if not IsBound( M!.UnitOfAlgebra ) then
        Error( "component `M!.UnitOfAlgebra' unbound\n" );
    fi;
    
    b := M!.UnitOfAlgebra;
    
    g := Coefficients( filt, Coerce( One( M!.GroupAlgebra ), b ) * g );
    
    if g = fail then
        return fail;
    fi;
    
    N := CertainObject( filt, 0 );
    
    n := Indeterminates( N!.AffineCoordinateRing );
    
    return LeftSubmodule( n - g );
    
end );

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

##
InstallMethod( DefectClasses,
        [ IsCharacterTable, IsInt ],
        
  function( ordtbl, p )
    
    return DefectClasses( ordtbl mod p );
    
end );

##
InstallMethod( DefectClasses,
        [ IsGroup, IsInt ],
        
  function( G, p )
    
    return DefectClasses( CharacterTable( G ), p );
    
end );
