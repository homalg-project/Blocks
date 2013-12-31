#############################################################################
##
##  Tools.gi                                                  Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Implementation stuff for tools.
##
#############################################################################

##
InstallMethod( FieldOfGroupRingElements,
        [ IsList ],
        
  function( e )
    
    e := Concatenation( List( e, CoefficientsAndMagmaElements ) );
    
    e := e{[ 2, 4 .. Length( e ) ]};
    
    return Field( e );
    
end );

##
InstallMethod( Coerce,
        [ IsPositionalObjectRep and IsElementOfFreeMagmaRing and IsMagmaRingObjDefaultRep,
          IsMultiplicativeElement ],
        
  function( o, r )
    local z;
    
    o := One( o );
    
    z := ZeroCoefficient( o );
    
    return ElementOfMagmaRing( FamilyObj( o ), z, [ One( z ) ], [ r ] );
    
end );

##
InstallMethod( Coerce,
        [ IsPositionalObjectRep and IsElementOfFreeMagmaRing and IsMagmaRingObjDefaultRep,
          IsPositionalObjectRep and IsElementOfFreeMagmaRing and IsMagmaRingObjDefaultRep ],
        
  function( o, r )
    local F;
    
    o := One( o );
    
    F := HomalgRing( CoefficientsAndMagmaElements( o )[2] );
    
    r := CoefficientsAndMagmaElements( r );
    
    r := ListToListList( r, Length( r ) / 2, 2 );
    
    return Sum( r, s -> ( s[2] / F ) * ( Coerce( o, s[1] ) ) );
    
end );

##
InstallMethod( Coefficients,
        [ IsFinitelyPresentedModuleRep and HasBasis,
          IsPositionalObjectRep and IsElementOfFreeMagmaRing and IsMagmaRingObjDefaultRep ],
        
  function( M, c )
    local bas, info, mon, z, n, R, m;
    
    bas := Basis( M )();
    
    info := GeneratorsOfModule( M )!.info;
    
    mon := info!.monomials;
    
    z := ShallowCopy( info!.zerovector );
    
    c := CoefficientsAndMagmaElements( c );
    
    c := ListToListList( c, Length( c ) / 2, 2 );
    
    Perform( c, function( m )
        local i;
        i := Position( mon, m[1] );
        if IsInt( i ) then
            z[i] := m[2];
        fi;
    end );
    
    n := Length( z );
    
    c := [ z ];
    
    c := GetListOfMatrixAsString( c );
    
    R := HomalgRing( M );
    
    c := HomalgMatrix( c, 1, n, R );
    
    m := Length( bas );
    
    bas := GetListOfMatrixAsString( bas );
    
    bas := HomalgMatrix( bas, m, n, R );
    
    c := RightDivide( c, bas );
    
    if not IsHomalgMatrix( c ) then
        return fail;
    fi;
    
    return EntriesOfHomalgMatrix( c );
    
end );

##
InstallMethod( Coefficients,
        [ IsHomalgFiltration,
          IsPositionalObjectRep and IsElementOfFreeMagmaRing and IsMagmaRingObjDefaultRep ],
        
  function( filt, c )
    local M, N, n, R;
    
    M := OnPresentationAdaptedToFiltration( filt );
    
    N := CertainObject( filt, 0 );
    
    c := Coefficients( M, c );
    
    if c = fail then
        return fail;
    fi;
    
    n := NrGenerators( N );
    
    R := N!.AffineCoordinateRing;
    
    return List( c{[ 1 .. n ]}, a -> a / R );
    
end );
