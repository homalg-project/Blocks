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
    
    if IsBound( b![999] ) then
        ## if block then real;
        ## see CentralIdempotentsOfInvolutiveAlgebra
        if b![999] then
            SetIsReal( B, true );
        fi;
        return b![999];
    fi;
    
    TryNextMethod( );
    
end );

##
InstallMethod( IsReal,
        [ IsAlgebra and HasOne and IsBlock ],
        
  function( B )
    local b;
    
    b := One( B );
    
    return b = Involution( b );
    
end );

####################################
#
# methods for attributes:
#
####################################

##
InstallMethod( CoefficientsRingForPolynomialAlgebra,
        [ IsAlgebra ],
        
  function( B )
    local kG;
    
    kG := UnderlyingGroupAlgebra( B );
    
    if not HasCoefficientsRingForPolynomialAlgebra( kG ) then
        TryNextMethod( );
    fi;
    
    return CoefficientsRingForPolynomialAlgebra( kG );
    
end );
    
##
InstallMethod( UnderlyingGroupAlgebra,
        [ IsAlgebra and HasOne ],
        
  function( B )
    local kG;
    
    kG := B;
    
    if HasLeftActingRingOfIdeal( kG ) then
        kG := LeftActingRingOfIdeal( kG );
        if HasLeftActingRingOfIdeal( kG ) then
            kG := LeftActingRingOfIdeal( kG );
        fi;
    fi;
    
    if not ( HasIsGroupAlgebra( kG ) and IsGroupAlgebra( kG ) and HasUnderlyingMagma( kG ) ) then
        ## I still do not know how to extend the scalars of an algebra
        ## with an external homalg ring R; luckily GroupRing( R, G ) works
        ## which is the reason we need a group here
        Error( "no underlying magma found\n" );
    fi;
    
    return kG;
    
end );

##
InstallMethod( UnderlyingGroupAlgebra,
        [ IsElementOfFreeMagmaRing ],
        
  function( b )
    
    ## see CentralIdempotentsOfInvolutiveAlgebra
    if not IsBound( b![1001] ) then
        Error( "unable to extract the underlying algebra" );
    fi;
    
    return UnderlyingGroupAlgebra( b![1001] );
    
end );

##
InstallMethod( UnderlyingBrauerTable,
        [ IsElementOfFreeMagmaRing ],
        
  function( b )
    local kG, G, p;
    
    kG := UnderlyingGroupAlgebra( b );
    
    G := UnderlyingMagma( kG );
    
    p := Characteristic( kG );
    
    return BrauerTable( G, p );
    
end );

##
InstallMethod( BlockOfIdempotent,
        [ IsElementOfFreeMagmaRing ],
        
  function( e )
    local kG, B;
    
    if IsBound( e![1234] ) and IsAlgebra( e![1234] ) then
        return e![1234];
    fi;
    
    ## see CentralIdempotentsOfInvolutiveAlgebra
    if not IsBound( e![1001] ) and IsAlgebra( e![1001] ) then
        TryNextMethod( );
    fi;
    
    kG := e![1001];
    
    B := TwoSidedIdeal( kG, [ e ] );
    
    SetOne( B, e );
    
    if IsBound( e![999] ) then
        SetIsBlock( B, e![999] );
        ## if block then real;
            ## see CentralIdempotentsOfInvolutiveAlgebra
        if e![999] then
            SetIsReal( B, true );
        fi;
    fi;
    
    if HasCoefficientsRingForPolynomialAlgebra( kG ) then
        SetCoefficientsRingForPolynomialAlgebra( B,
                CoefficientsRingForPolynomialAlgebra( kG ) );
    fi;
    
    ## FIXME: undocumented, is there a way to add a `component' to IsMagmaRingObjDefaultRep
    e![1234] := B;
    
    return B;
    
end );

##
InstallMethod( PrincipalBlockIdempotent,
        [ IsGroupAlgebra ],
        
  function( kG )
    local e;
    
    ## CentralIdempotentsOfAlgebra does not store kG in the e's
    e := CentralIdempotentsOfInvolutiveAlgebra( kG );
    
    return First( e, b -> IsOne( Sum( CoefficientsBySupport( b ) ) ) );
    
end );

##
InstallMethod( PrincipalBlock,
        [ IsGroupAlgebra ],
        
  function( kG )
    local b0, B0;
    
    b0 := PrincipalBlockIdempotent( kG );
    
    B0 := BlockOfIdempotent( b0 );
    
    SetIsBlock( B0, true );
    SetIsReal( B0, true );
    
    return B0;
    
end );

##
InstallMethod( CentralNonPrincipalIdempotentsOfGroupAlgebra,
        [ IsGroupAlgebra ],
        
  function( kG )
    local e, pos;
    
    ## CentralIdempotentsOfAlgebra does not store kG in the e's
    e := CentralIdempotentsOfInvolutiveAlgebra( kG );
    
    e := ShallowCopy( e );
    
    pos := PositionProperty( e, b -> IsOne( Sum( CoefficientsBySupport( b ) ) ) );
    
    Remove( e, pos );
    
    return e;
    
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
InstallMethod( BrauerCharactersDegrees,
        [ IsBrauerTable ],
        
  function( modtbl )
    local blocks;
    
    blocks := BlocksInfo( modtbl );
    
    return List( blocks, b -> List( Irr( modtbl ){b.modchars}, Degree ) );
    
end );

##
InstallMethod( DecompositionMatrixPerBlock,
        [ IsBrauerTable ],
        
  function( modtbl )
    local blocks, decmats;
    
    blocks := BlocksInfo( modtbl );
    
    return List( [ 1 .. Length( blocks ) ], i -> DecompositionMatrix( modtbl, i ) );
    
end );

##
InstallMethod( CartanMatrixPerBlock,
        [ IsBrauerTable ],
        
  function( modtbl )
    local decmats;
    
    decmats := DecompositionMatrixPerBlock( modtbl );
    
    return List( decmats, decmat -> TransposedMat( decmat ) * decmat );
    
end );

## the notion is used in [Gow]
InstallMethod( CentralCharactersOfBlocks,
        [ IsBrauerTable ],
        
  function( modtbl )
    local ordtbl, blocks, c, omegas;
    
    ordtbl := OrdinaryCharacterTable( modtbl );
    
    blocks := BlocksInfo( modtbl );
    
    ## for each block B compute the central character omega_chi,
    ## where chi is some ordinary character belonging to B
    omegas := List( blocks,
                    B -> CentralCharacter( Irr( ordtbl )[B.ordchars[1]] ) );
    
    c := UnderlyingCharacteristic( modtbl );
    
    ## for each block B compute its central character omega
    omegas := List( omegas,
                    o -> List( o, b -> FrobeniusCharacterValue( b, c ) ) );
    
    Perform( [ 1 .. Length( blocks ) ],
            function( i )
              blocks[i]!.CentralCharacterOfBlock := omegas[i];
            end );
    
    return omegas;
    
end );

##
InstallMethod( BlocksInfo,
        [ IsElementOfFreeMagmaRing ],
        
  function( b )
    local modtbl, omegas, coeffs, prod, pos, block;
    
    modtbl := UnderlyingBrauerTable( b );
    
    omegas := CentralCharactersOfBlocks( modtbl );
    
    coeffs := Coefficients( b );
    
    prod := List( omegas, omega -> omega * coeffs );
    
    ## omega( b ) = 1 if omega <-> b otherwise omega( b ) = 0
    pos := PositionProperty( prod, a -> not IsZero( a ) );
    
    Assert( 0, IsOne( prod[pos] ) );
    Assert( 0, PositionProperty( prod, a -> not IsZero( a ), pos + 1 ) = fail );
    
    block := BlocksInfo( modtbl )[pos];
    
    block!.BlockIdempotent := b;
    
    return block;
    
end );

##
InstallMethod( BlocksInfo,
        [ IsAlgebra and HasOne ],
        
  function( B )
    
    return BlocksInfo( One( B ) );
    
end );

##  <#GAPDoc Label="DefectClasses_code">
##  <Listing Type="Code"><![CDATA[
InstallMethod( DefectClasses,
        [ IsElementOfFreeMagmaRing ],
        
  function( b )
    local modtbl, ordtbl, classes, block, omega, pos;
    
    modtbl := UnderlyingBrauerTable( b );
    
    ordtbl := OrdinaryCharacterTable( modtbl );
    
    classes := ConjugacyClasses( ordtbl );
    
    ## trigger computing all central characters of which one is needed below
    CentralCharactersOfBlocks( modtbl );
    
    block := BlocksInfo( b );
    
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
##  ]]></Listing>
##  <#/GAPDoc>

##
InstallMethod( DefectClasses,
        [ IsAlgebra and HasOne ],
        
  function( B )
    
    return DefectClasses( One( B ) );
    
end );

##  <#GAPDoc Label="DefectGroup_code">
##  <Listing Type="Code"><![CDATA[
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
##  ]]></Listing>
##  <#/GAPDoc>

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
InstallMethod( BrauerCharactersDegrees,
        [ IsCharacterTable, IsInt ],
        
  function( ordtbl, p )
    
    return BrauerCharactersDegrees( ordtbl mod p );
    
end );

##
InstallMethod( BrauerCharactersDegrees,
        [ IsGroup, IsInt ],
        
  function( G, p )
    
    return BrauerCharactersDegrees( CharacterTable( G ), p );
    
end );

##
InstallMethod( DecompositionMatrixPerBlock,
        [ IsCharacterTable, IsInt ],
        
  function( ordtbl, p )
    
    return DecompositionMatrixPerBlock( ordtbl mod p );
    
end );

##
InstallMethod( DecompositionMatrixPerBlock,
        [ IsGroup, IsInt ],
        
  function( G, p )
    
    return DecompositionMatrixPerBlock( CharacterTable( G ), p );
    
end );

##
InstallMethod( CartanMatrixPerBlock,
        [ IsCharacterTable, IsInt ],
        
  function( ordtbl, p )
    
    return CartanMatrixPerBlock( ordtbl mod p );
    
end );

##
InstallMethod( CartanMatrixPerBlock,
        [ IsGroup, IsInt ],
        
  function( G, p )
    
    return CartanMatrixPerBlock( CharacterTable( G ), p );
    
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
