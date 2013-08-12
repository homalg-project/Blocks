#############################################################################
##
##  UnitaryGroup.gi                                           Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Implementation stuff for tools.
##
#############################################################################

##
InstallMethod( UnitaryGroup,
        [ IsHomalgModule and IsZero ],
        
  function( M )
    
    return ZeroLeftSubmodule( HomalgRing( M ) );
    
end );


##
InstallMethod( UnitaryGroup,
        [ IsHomalgModule and HasBasis ],
        
  function( M )
    local x, S, a;
    
    x := GeneralElement( M );
    
    S := Antipode( M );
    
    if IsBound( M!.UnitOfAlgebraicGroup ) then
        a := x * ( x * S ) - One( x );
    else
        a := x + ( x * S ) + x * ( x * S );
    fi;
    
    return ExtractDefiningIdeal( a );
    
end );

##
InstallMethod( UnitaryGroup,
        [ IsRing, IsAlgebra ],
        
  function( F, I )
    local M;
    
    M := UnderlyingModule( F, I );
    
    return UnitaryGroup( M );
    
end );

##
InstallMethod( UnitaryGroupModuloIdeal,
        [ IsHomalgFiltration ],
        
  function( filt )
    local N, phi;
    
    N := CertainObject( filt, 0 );
    
    phi := N!.RingMap( );
    
    return KernelSubobject( phi );
    
end );

##
InstallMethod( UnitaryGroup,
        [ IsRing, IsAlgebra, IsAlgebra ],
        
  function( F, I, J )
    local filt;
    
    filt := InducedFiltration( F, [ I, J ] );
    
    return UnitaryGroupModuloIdeal( filt );
    
end );

##
InstallMethod( SemiSimplePartOfUnitaryGroup,
        [ IsRing, IsAlgebra ],
        
  function( F, A )
    local r, I;
    
    if IsBound( A!.SemiSimplePartOfUnitaryGroup ) and IsIdenticalObj( A!.SemiSimplePartOfUnitaryGroup[1], F ) then
        return A!.SemiSimplePartOfUnitaryGroup[2];
    fi;
    
    if not ( IsAlgebraWithOne( A ) or ( HasOne( A ) and not One( A ) = fail ) ) then
        Error( "the algebra does not contain a one\n" );
    fi;
    
    r := RadicalOfAlgebraPowersAsIntersection( A );
    
    I := UnitaryGroup( F, A, r.1 );
    
    A!.SemiSimplePartOfUnitaryGroup := [ F, I ];
    
    return I;
    
end );

##
InstallMethod( RadicalPartOfUnitaryGroup,
        [ IsRing, IsAlgebra ],
        
  function( F, A )
    local r, I;
    
    if IsBound( A!.RadicalPartOfUnitaryGroup ) and IsIdenticalObj( A!.RadicalPartOfUnitaryGroup[1], F ) then
        return A!.RadicalPartOfUnitaryGroup[2];
    fi;
    
    if not ( IsAlgebraWithOne( A ) or ( HasOne( A ) and not One( A ) = fail ) ) then
        Error( "the algebra does not contain a one\n" );
    fi;
    
    r := RadicalOfAlgebraPowersAsIntersection( A );
    
    I := UnitaryGroup( F, r.1 );
    
    A!.RadicalPartOfUnitaryGroup := [ F, I ];
    
    return I;
    
end );

##
InstallMethod( CotangentPartOfUnitaryGroup,
        [ IsRing, IsAlgebra ],
        
  function( F, A )
    local r, I;
    
    if IsBound( A!.CotangentPartOfUnitaryGroup ) and IsIdenticalObj( A!.CotangentPartOfUnitaryGroup[1], F ) then
        return A!.CotangentPartOfUnitaryGroup[2];
    fi;
    
    if not ( IsAlgebraWithOne( A ) or ( HasOne( A ) and not One( A ) = fail ) ) then
        Error( "the algebra does not contain a one\n" );
    fi;
    
    r := RadicalOfAlgebraPowersAsIntersection( A );
    
    if not IsBound( r.2 ) then
        I := UnitaryGroup( F, r.1 );
    else
        I := UnitaryGroup( F, r.1, r.2 );
    fi;
    
    A!.CotangentPartOfUnitaryGroup := [ F, I ];
    
    return I;
    
end );

##
InstallMethod( IsCotangentPartUnionOfAffineSpaces,
        [ IsRing, IsAlgebra ],
        
  function( F, A )
    local I, rad, d;
    
    I := CotangentPartOfUnitaryGroup( F, A );
    
    rad := RadicalDecomposition( I );
    
    d := List( rad, AffineDegree );
    
    if Length( Set( d ) ) > 1 then
        Error( "something went wrong, not all affine degrees coincide\n" );
    fi;
    
    return Set( d ) = [ 1 ];
    
end );

##
InstallMethod( LowerPartOfUnitaryGroup,
        [ IsRing, IsAlgebra ],
        
  function( F, A )
    local r, I;
    
    if IsBound( A!.LowerPartOfUnitaryGroup ) and IsIdenticalObj( A!.LowerPartOfUnitaryGroup[1], F ) then
        return A!.LowerPartOfUnitaryGroup[2];
    fi;
    
    if not ( IsAlgebraWithOne( A ) or ( HasOne( A ) and not One( A ) = fail ) ) then
        Error( "the algebra does not contain a one\n" );
    fi;
    
    r := RadicalOfAlgebraPowersAsIntersection( A );
    
    if not IsBound( r.2 ) then
        I := ZeroLeftSubmodule( F );
    else
        I := UnitaryGroup( F, r.2 );
    fi;
    
    A!.LowerPartOfUnitaryGroup := [ F, I ];
    
    return I;
    
end );

##
InstallMethod( IsLowerPartExtensionOfAffineSpaces,
        [ IsRing, IsAlgebra ],
        
  function( F, A )
    local r, powers, i, l, I, d;
    
    if not ( IsAlgebraWithOne( A ) or ( HasOne( A ) and not One( A ) = fail ) ) then
        Error( "the algebra does not contain a one\n" );
    fi;
    
    r := RadicalOfAlgebraPowersAsIntersection( A );
    
    powers := NamesOfComponents( r );
    
    powers := List( powers, Int );
    
    powers := Filtered( powers, IsPosInt );
    
    Sort( powers );
    
    if powers = [ ] then
        return true;
    fi;
    
    l := Length( powers );

    if not powers[l] = l then
        Error( "the list of powers is not [ 1 .. its lenght ]\n" );
    fi;
    
    if l = 1 then
        return true;
    fi;
    
    for i in powers{[ 2 .. l - 1 ]} do
        
        I := UnitaryGroup( F, r.(i), r.(i + 1) );
        d := AffineDegree( I );
        
        if d = 0 then
            Error( "affine degree is zero, something went wrong\n" );
        elif d > 1 then
            return false;
        fi;
    od;
    
    I := UnitaryGroup( F, r.(l) );
    d := AffineDegree( I );
    
    if d = 0 then
        Error( "affine degree is zero, something went wrong\n" );
    elif d > 1 then
        return false;
    fi;
    
    return true;
    
end );
