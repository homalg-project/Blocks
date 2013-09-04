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
        [ IsRingElement,
          IsPositionalObjectRep and IsElementOfFreeMagmaRing and IsMagmaRingObjDefaultRep ],
        
  function( o, r )
    local F;
    
    o := One( o );
    
    F := HomalgRing( CoefficientsAndMagmaElements( o )[2] );
    
    r := CoefficientsAndMagmaElements( r );
    
    r := ListToListList( r, Length( r ) / 2, 2 );
    
    return Sum( r, s -> ( s[2] / F ) * ( o * s[1] ) );
    
end );

##
InstallMethod( Coefficients,
        [ IsFinitelyPresentedModuleRep and HasBasis,
          IsPositionalObjectRep and IsElementOfFreeMagmaRing and IsMagmaRingObjDefaultRep ],
        
  function( M, c )
    local mon, z, n, R, bas, m;
    
    mon := M!.info!.monomials;
    
    z := ShallowCopy( M!.info!.zerovector );
    
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
    
    bas := Basis( M );
    
    m := Length( bas );
    
    bas := GetListOfMatrixAsString( bas );
    
    bas := HomalgMatrix( bas, m, n, R );
    
    c := RightDivide( c, bas );
    
    if not IsHomalgMatrix( c ) then
        Error( "element not contained in the module\n" );
    fi;
    
    return EntriesOfHomalgMatrix( c );
    
end );
