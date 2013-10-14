#############################################################################
##
##  Algebras.gi                                               Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Implementation stuff for algebras.
##
#############################################################################

##
InstallMethod( RadicalOfAlgebraPowers,
        [ IsAlgebra ],
        
  function( A )
    local J, gens, n, Jn, dim;
    
    Dimension( A );
    
    J := RadicalOfAlgebra( A );
    
    Dimension( J );
    
    gens := GeneratorsOfLeftModule( J );
    
    if gens = [ ] then
        SetLeftActingRingOfIdeal( J, A );
        J := rec( 0 := A, 1 := J );
        return J;
    fi;
    
    J := rec( 0 := A, 1 := TwoSidedIdealByGenerators( A, gens ) );
    
    n := 1;
    
    while true do
        
        Jn := BasisVectors( Basis( J.(n) ) );
        Jn := List( Jn, a -> List( gens, b -> a * b ) );
        Jn := Concatenation( Jn );
        Jn := TwoSidedIdealByGenerators( A, Jn );
        
        dim := Dimension( Jn );
        Assert( 0, dim < Dimension( J.(n) ) );
        
        n := n + 1;
        J.(n) := Jn;
        
        if dim = 0 then
            return J;
        fi;
        
    od;
    
end );

##
InstallMethod( RadicalOfAlgebraPowersAsIntersection,
        [ IsAlgebra ],
        
  function( A )
    local B, r, JA, powers, J, n, Jn;
    
    if not HasLeftActingRingOfIdeal( A ) then
        return RadicalOfAlgebraPowers( A );
    fi;
    
    B := LeftActingRingOfIdeal( A );
    
    r := RadicalOfAlgebraPowers( B );
    
    if A = B then
        return r;
    fi;
    
    JA := RadicalOfAlgebraPowers( A );
    
    powers := NamesOfComponents( JA );
    
    powers := List( powers, Int );
    
    powers := Filtered( powers, i -> i >= 0 );
    
    Sort( powers );
    
    J := rec( 0 := A );
    
    for n in powers do
        
        J.(n) := Intersection( r.(n), A );
        
        SetLeftActingRingOfIdeal( J.(n), A );
        
        Assert( 0, J.(n) = JA.(n) );
        
    od;
    
    return J;
    
end );

##
InstallMethod( AugmentationIdealPowers,
        [ IsAlgebraWithOne and IsGroupAlgebra ],
        
  function( kG )
    local J, gens, n, Jn, dim;
    
    Dimension( kG );
    
    J := AugmentationIdeal( kG );
    gens := GeneratorsOfLeftModule( J );
    J := rec( 0 := kG, 1 := J );
    
    n := 1;
    
    while true do
        
        Jn := BasisVectors( Basis( J.(n) ) );
        Jn := List( Jn, a -> List( gens, b -> a * b ) );
        Jn := Concatenation( Jn );
        
        if Jn = [ ] then
            Jn := [ Zero( kG ) ];
        fi;
        
        Jn := TwoSidedIdealByGenerators( kG, Jn );
        
        dim := Dimension( Jn );
        
        if dim = Dimension( J.(n) ) then
            return J;
        fi;
        
        n := n + 1;
        J.(n) := Jn;
        
    od;
    
end );

##
InstallMethod( HighestPowerOfAugmentationIdeal,
        [ IsAlgebraWithOne ],
        
  function( kG )
    local i, p;
    
    i := AugmentationIdealPowers( kG );
    
    p := NamesOfComponents( i );
    
    p := List( p, Int );
    
    p := Maximum( p );
    
    Assert( 0, IsBound( i.(p) ) and not IsBound( i.(p + 1) ) );
    
    return i.(p);
    
end );

##
InstallMethod( CentralIdempotentsOfInvolutiveAlgebra,
        [ IsAlgebraWithOne ],
        
  function( A )
    local e;
    
    e := CentralIdempotentsOfAlgebra( A );
    
    e := List( e,
               function( c )
                 if not c = Involution( c ) then
                     ## c is an idempotent of a complex block
                     c := c + Involution( c );
                     c![999] := false;
                 else
                     ## c is an idempotent of a real block
                     c![999] := true;
                 fi;
                 return c;
               end );
    
    e := DuplicateFreeList( e );
    
    Assert( 0, IsOne( Sum( e ) ) );
    
    ## FIXME: undocumented, is there a way to add a `component' to IsMagmaRingObjDefaultRep
    ## see UnderlyingGroupAlgebra
    Perform( e, function( c ) c![1001] := A; end );
    
    return e;
    
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
InstallMethod( UnderlyingModule,
        [ IsRing, IsAlgebra ],
        
  function( F, J )
    local kG, G, k, save, n, bas, R, RG, one, BAS, gens, rels, M, RJ, basis;
    
    if IsBound( J!.HomalgModule ) and IsIdenticalObj( J!.HomalgModule[1], F ) then
        return J!.HomalgModule[2];
    fi;
    
    if HasLeftActingRingOfIdeal( J ) then
        kG := LeftActingRingOfIdeal( J );
        ## the previous kG might still be the block
        if HasLeftActingRingOfIdeal( kG ) then
            kG := LeftActingRingOfIdeal( kG );
        fi;
    else
        kG := J;
    fi;
    
    if not ( HasIsGroupAlgebra( kG ) and IsGroupAlgebra( kG ) and HasUnderlyingMagma( kG ) ) then
        ## I still do not know how to extend the scalars of an algebra
        ## with an external homalg ring R; luckily GroupRing( R, G ) works
        ## which is the reason we need a group here
        Error( "no underlying magma found\n" );
    fi;
    
    G := UnderlyingMagma( kG );
    
    k := LeftActingDomain( kG );
    
    if Characteristic( k ) <> Characteristic( F ) then
        Error( "the characteristics of first and second argument are different\n" );
    elif DegreeOverPrimeField( k ) <> DegreeOverPrimeField( F ) then
        Error( "fields are over different degree over the prime field\n" );
    fi;
    
    save := HOMALG_MATRICES!.PreferDenseMatrices;
    HOMALG_MATRICES!.PreferDenseMatrices := true;
    
    k := HomalgRingOfIntegers( Characteristic( k ), DegreeOverPrimeField( k ) );
    
    HOMALG_MATRICES!.PreferDenseMatrices := save;
    
    n := Dimension( J );
    
    if n = 0 then
        return ZeroLeftModule( F );
    fi;
    
    bas := Basis( J );
    
    ## sanity check
    if not n = Length( bas ) then
        Error( "dimension of the given two-sided ideal differs from",
               "the cardinality of its basis, something went wrong\n" );
    fi;
    
    if IsBound( J!.CoordinateRing ) and IsIdenticalObj( J!.CoordinateRing[1], F ) then
        R := J!.CoordinateRing[2];
        RG := J!.CoordinateRing[3];
    else
        R := F * Concatenation( "x1..", String( n ) );
        RG := GroupRing( R, G );
        
        ## another sanity check; almost notorious
        if List( List( Basis( kG ) ),
                 function( b ) if Length( b![2] ) = 2 then return b![2][1]; else Error( "expected two entries\n" ); fi; end )
        <>
           List( List( Basis( RG ) ),
                 function( b ) if Length( b![2] ) = 2 then return b![2][1]; else Error( "expected two entries\n" ); fi; end ) then
            Error( "different bases for group algebra\m" );
        fi;
        
        J!.CoordinateRing := [ F, R, RG ];
        J!.Embedding := Embedding( G, RG );
    fi;
    
    one := One( RG );
    BAS := List( bas, b -> Coerce( one, b ) );
    
    gens := HomalgGeneratorsForLeftModule( BAS, k );
    gens!.ring := R;
    gens!.ConvertTransitionMatrix :=
      function( T )
        if IsEmptyMatrix( T ) then
            return k * T;
        fi;
        ## do not redefine R below
        return HomalgMatrix( EntriesOfHomalgMatrixAsListList( R * T ), k );
    end;
    
    rels := HomalgRelationsForLeftModule( HomalgZeroMatrix( 0, n, R ) );
    
    M := Presentation( gens, rels );
    SetAsOriginalPresentation( M );
    SetIsFinite( RG, false );
    M!.UnderlyingAlgebra := J;
    M!.GroupAlgebra := RG;
    M!.AffineCoordinateRing := R;
    
    ## FIXME: this is a dirty hack and has to be revisited once we
    ## have a clear and clean categorical concept of generators
    SetBasis( M, function( )
        local gens, BAS, RJ, basis;
        
        ## get the current generators, not the ones set above
        gens := GeneratorsOfModule( M );
        if not IsBound( gens!.Basis ) then
            BAS := MatrixOfGenerators( gens );
            BAS := EntriesOfHomalgMatrix( BAS );
            RJ := FreeLeftModule( RG, BAS, "basis" );
            gens!.info := NiceFreeLeftModuleInfo( RJ );
            basis := GeneratorsOfLeftOperatorAdditiveGroup( NiceFreeLeftModule( RJ ) );
            if not Length( basis ) = NrGenerators( gens ) then
                Error( "this is not a basis\n" );
            fi;
            gens!.Basis := basis;
        fi;
        return gens!.Basis;
    end );
    
    LockObjectOnCertainPresentation( M );
    
    if HasOne( J ) then
        one := Coefficients( bas, One( J ) );
        one := [ List( one, e -> e / k ) ];
        one := R * HomalgMatrix( one, k );
        one := HomalgMap( one, 1 * R, M );
        one := HomalgElement( one );
        
        Assert( 0, one^2 = one );
        SetIsOne( one, true );
        
        M!.UnitOfAlgebraicGroup := one;
    fi;
    
    J!.HomalgModule := [ F, M ];
    
    UnlockObject( M );
    
    return M;
    
end );

##
InstallMethod( InducedFiltration,
        [ IsRing, IsList ],
        
  function( F, L )
    local l, J, M, n, k, R, bas, prefilt, gens, degrees, filt, N, S;
    
    l := Length( L );
    
    if l = 0 then
        Error( "empty list\n" );
    elif ForAny( L, a -> not IsRing( a ) ) then
        TryNextMethod( );
    fi;
    
    J := L[1];
    
    M := UnderlyingModule( F, J );
    
    n := Rank( M );
    
    k := HomalgRing( MatrixOfGenerators( M ) );
    
    R := HomalgRing( M );
    
    bas := Basis( J );
    
    prefilt := [ HomalgMap( HomalgIdentityMatrix( n, R ), "free", M ) ];
    
    for gens in L{[ 2 .. l ]} do
        gens := List( Basis( gens ) );
        if gens = [ ] then
            break;
            #gens := HomalgZeroMatrix( 0, Rank( M ), R );
        else
            gens := List( gens, v -> Coefficients( bas, v ) );
            gens := R * HomalgMatrix( gens, k );
        fi;
        gens := HomalgMap( gens, "free", M );
        Add( prefilt, gens );
    od;
    
    l := Length( prefilt );
    
    degrees := [ -l + 1 .. 0 ];
    
    filt := rec( degrees := degrees, tower := true );
    
    Perform( degrees, function( i ) filt.(String( i )) := prefilt[-i + 1]; end );
    
    filt := HomalgAscendingFiltration( filt );
    
    OnPresentationAdaptedToFiltration( filt );
    
    N := CertainObject( filt, 0 );
    
    if IsBound( M!.UnitOfAlgebraicGroup ) then
        N!.UnitOfAlgebraicGroup :=
          HomalgElement( PostDivide( UnderlyingMorphism( M!.UnitOfAlgebraicGroup ), NaturalGeneralizedEmbedding( N ) ) );
    fi;
    
    S := F * Concatenation( "y1..", String( Rank( N ) ) );
    N!.AffineCoordinateRing := S;
    
    N!.RingMap :=
      function( )
        local R, map, indets, I;
        
        R := HomalgRing( M );
        
        map := NaturalGeneralizedEmbedding( N )^-1;
        Assert( 0, IsEpimorphism( map ) );
        
        indets := Indeterminates( R );
        indets := HomalgMatrix( indets, 1, Length( indets ), R );
        
        indets := indets * ( R * MatrixOfMap( map ) );
        
        I := DefiningIdealOfUnitaryGroup( M );
        
        map := RingMap( indets, S, R / I );
        SetIsMorphism( map, true );
        
        return map;
        
    end;
    
    return filt;
    
end );

##
InstallMethod( InducedFiltration,
        [ IsRing, IsRecord ],
        
  function( F, L )
    
    L := List( SortedList( List( NamesOfComponents( L ), Int ) ), c -> L.(c) );
    
    return InducedFiltration( F, L );
    
end );
