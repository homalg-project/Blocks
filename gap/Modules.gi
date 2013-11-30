#############################################################################
##
##  Modules.gi                                                Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Implementation stuff for modules.
##
#############################################################################

##
InstallMethod( GeneralElement,
        [ IsHomalgModule and HasBasis ],
        
  function( M )
    local gens, R, indets;
    
    gens := GeneratorsOfModule( M );
    
    if not IsBound( M!.AffineCoordinateRing ) then
        TryNextMethod( );
    fi;
    
    R := M!.AffineCoordinateRing;
    
    indets := Indeterminates( R );
    
    indets := HomalgModuleElement( indets, M );
    
    if IsBound( M!.UnitOfAlgebraicGroup ) then
        SetOneImmutable( indets, M!.UnitOfAlgebraicGroup );
    fi;
    
    return indets;
    
end );

##
InstallMethod( GeneralElementsOfFiltration,
        [ IsHomalgFiltration ],
        
  function( filt )
    local degrees, l, M, n, R, indets, vars, r;
    
    degrees := DegreesOfFiltration( filt );
    
    l := Length( degrees );
    
    M := UnderlyingObject( filt );
    
    n := NrGenerators( M );
    
    if not IsBound( M!.GroupAlgebra ) then
        Error( "the component `GroupAlgebra' not found\n" );
    fi;
    
    R := LeftActingDomain( M!.GroupAlgebra );
    
    indets := Indeterminates( R );
    
    vars := List( ObjectsOfFiltration( filt ), NrGenerators );
    
    vars := List( [ 1 .. l ], i -> [ n - Sum( vars{[ 1 .. i ]} ) + 1 .. n - Sum( vars{[ 1 .. i - 1 ]} ) ] );
    
    vars := List( vars, a -> indets{a} );
    
    if HasBaseRing( R ) then
        r := BaseRing( R );
    else
        r := CoefficientsRing( R );
    fi;
    
    Perform( [ 1 .. l ], function( i ) CertainObject( filt, degrees[i] )!.RingOfGeneralElement := r * List( vars[i], Name ); end );
    
    vars := List( [ 1 .. l ], i -> HomalgModuleElement( vars[i], CertainObject( filt, degrees[i] ) ) );
    
    Perform( [ 1 .. l ], function( i ) CertainObject( filt, degrees[i] )!.GeneralElement := vars[i]; end );
    
    vars := Reversed( vars );
    
    if IsBound( SuperObject( vars[1] )!.UnitOfAlgebraicGroup ) then
        SetOneImmutable( vars[1], SuperObject( vars[1] )!.UnitOfAlgebraicGroup );
    fi;
    
    return vars;
    
end );

##
InstallMethod( AsElementOfAlgebra,
        [ IsHomalgModuleElement ],
        
  function( a )
    
    a := UnderlyingMorphism( a );
    a := MatrixOfMap( a ) * GeneratorsOfModule( Range( a ) );
    a := MatrixOfGenerators( a );
    
    return MatElm( a, 1, 1 );
    
end );
    
##
InstallMethod( Antipode,
        [ IsHomalgModule and HasBasis ],
        
  function( M )
    local x, Sx, S, n, R;
    
    LockObjectOnCertainPresentation( M );
    
    x := MatrixOfGenerators( M );
    x := EntriesOfHomalgMatrix( x );
    
    Sx := List( x, Involution );
    
    S := List( Sx, v -> Coefficients( M, v ) );
    
    S := GetListOfMatrixAsString( S );
    
    n := Rank( M );
    
    R := HomalgRing( M );
    
    S := HomalgMatrix( S, n, n, R );
    
    S := HomalgMap( S, M, M );
    
    UnlockObject( M );
    
    return S;
    
end );

##
InstallOtherMethod( \*,
        [ IsHomalgModuleElement, IsHomalgModuleElement ],
        
  function( a, b )
    local N, M, bas, c, n, R, T;
    
    N := SuperObject( a );
    
    if IsBound( N!.NaturalGeneralizedEmbedding ) then
        M := Range( NaturalGeneralizedEmbedding( N ) );
    else
        M := N;
    fi;
    
    a := AsElementOfAlgebra( a );
    b := AsElementOfAlgebra( b );
    
    c := a * b;
    
    c := Coefficients( M, c );
    
    c := HomalgModuleElement( c, M );
    
    c := UnderlyingMorphism( c );
    
    if IsBound( N!.NaturalGeneralizedEmbedding ) then
        c := PostDivide( c, NaturalGeneralizedEmbedding( N ) );
    fi;
    
    return HomalgElement( c );
    
end );

##
InstallOtherMethod( POW,
        [ IsHomalgModuleElement, IsPosInt ],
        
  function( a, i )
    
    return Product( ListWithIdenticalEntries( i, a ) );
    
end );

##
InstallMethod( GradedPartsOfFilteredMorphism,
        [ IsHomalgMorphism, IsHomalgFiltration ],
        
  function( phi, filt )
    local gr_phi;
    
    gr_phi := List( ObjectsOfFiltration( filt ),
                    function( o )
                      local emb, gr_phi;
                      
                      emb := NaturalGeneralizedEmbedding( o );
                      gr_phi := PostDivide( PreCompose( emb, phi ), emb );
                      if gr_phi = fail then
                          Error( "the morphism is not filtered w.r.t. the given filtration\n" );
                      fi;
                      Assert( 0, IsMorphism( gr_phi ) );
                      
                      return gr_phi;
                      
                  end );
                  
    return Reversed( gr_phi );
    
end );

##
InstallMethod( ExtractDefiningIdeal,
        [ IsHomalgModuleElement ],
        
  function( a )
    local I;
    
    I := MatrixOfMap( UnderlyingMorphism( a ) );
    I := EntriesOfHomalgMatrix( I );
    I := Filtered( I, a -> not IsZero( a ) );
    I := DuplicateFreeList( I );
    
    return LeftSubmodule( I, HomalgRing( a ) );
    
end );
