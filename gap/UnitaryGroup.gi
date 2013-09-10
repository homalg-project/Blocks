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
InstallMethod( DefiningIdealOfUnitaryGroup,
        [ IsHomalgModule and IsZero ],
        
  function( M )
    local I;
    
    I := ZeroLeftSubmodule( HomalgRing( M ) );
    
    I!.HomalgModule := M;
    
    return I;
    
end );

##
InstallMethod( DefiningIdealOfUnitaryGroup,
        [ IsHomalgModule and HasBasis ],
        
  function( M )
    local x, S, a, I;
    
    x := GeneralElement( M );
    
    S := Antipode( M );
    
    if IsBound( M!.UnitOfAlgebraicGroup ) then
        a := x * ( x * S ) - One( x );
    else
        a := x + ( x * S ) + x * ( x * S );
    fi;
    
    I := ExtractDefiningIdeal( a );
    
    I!.HomalgModule := M;
    
    return I;
    
end );

##
InstallMethod( DefiningIdealOfUnitaryGroup,
        [ IsRing, IsAlgebra ],
        
  function( F, I )
    local M;
    
    M := UnderlyingModule( F, I );
    
    return DefiningIdealOfUnitaryGroup( M );
    
end );

##
InstallMethod( DefiningIdealOfUnitaryGroupModuloIdeal,
        [ IsHomalgFiltration ],
        
  function( filt )
    local N, phi, I;
    
    N := CertainObject( filt, 0 );
    
    phi := N!.RingMap( );
    
    I := KernelSubobject( phi );
    
    I!.HomalgFiltration := filt;
    
    return I;
    
end );

##
InstallMethod( DefiningIdealOfUnitaryGroup,
        [ IsRing, IsRecord ],
        
  function( F, L )
    local filt;
    
    filt := InducedFiltration( F, L );
    
    return DefiningIdealOfUnitaryGroupModuloIdeal( filt );
    
end );

##
InstallMethod( DefiningIdealOfUnitaryGroup,
        [ IsRing, IsList ],
        
  function( F, L )
    local filt;
    
    filt := InducedFiltration( F, L );
    
    return DefiningIdealOfUnitaryGroupModuloIdeal( filt );
    
end );

##
InstallMethod( DefiningIdealOfUnitaryGroup,
        [ IsRing, IsAlgebra, IsAlgebra ],
        
  function( F, I, J )
    
    return DefiningIdealOfUnitaryGroup( F, [ I, J ] );
    
end );

##
InstallMethod( DefiningIdealOfSemiSimplePartOfUnitaryGroup,
        [ IsRing, IsAlgebra ],
        
  function( F, A )
    local r, I;
    
    if IsBound( A!.DefiningIdealOfSemiSimplePartOfUnitaryGroup ) and
       IsIdenticalObj( A!.DefiningIdealOfSemiSimplePartOfUnitaryGroup[1], F ) then
        return A!.DefiningIdealOfSemiSimplePartOfUnitaryGroup[2];
    fi;
    
    if not ( IsAlgebraWithOne( A ) or ( HasOne( A ) and not One( A ) = fail ) ) then
        Error( "the algebra does not contain a one\n" );
    fi;
    
    r := RadicalOfAlgebraPowersAsIntersection( A );
    
    I := DefiningIdealOfUnitaryGroup( F, A, r.1 );
    
    A!.DefiningIdealOfSemiSimplePartOfUnitaryGroup := [ F, I ];
    
    return I;
    
end );

##
InstallMethod( DefiningIdealOfRadicalPartOfUnitaryGroup,
        [ IsRing, IsAlgebra ],
        
  function( F, A )
    local r, I;
    
    if IsBound( A!.DefiningIdealOfRadicalPartOfUnitaryGroup ) and
       IsIdenticalObj( A!.DefiningIdealOfRadicalPartOfUnitaryGroup[1], F ) then
        return A!.DefiningIdealOfRadicalPartOfUnitaryGroup[2];
    fi;
    
    if not ( IsAlgebraWithOne( A ) or ( HasOne( A ) and not One( A ) = fail ) ) then
        Error( "the algebra does not contain a one\n" );
    fi;
    
    r := RadicalOfAlgebraPowersAsIntersection( A );
    
    I := DefiningIdealOfUnitaryGroup( F, r.1 );
    
    A!.DefiningIdealOfRadicalPartOfUnitaryGroup := [ F, I ];
    
    return I;
    
end );

##
InstallMethod( DefiningIdealOfCotangentPartOfUnitaryGroup,
        [ IsRing, IsAlgebra ],
        
  function( F, A )
    local r, I;
    
    if IsBound( A!.DefiningIdealOfCotangentPartOfUnitaryGroup ) and
       IsIdenticalObj( A!.DefiningIdealOfCotangentPartOfUnitaryGroup[1], F ) then
        return A!.DefiningIdealOfCotangentPartOfUnitaryGroup[2];
    fi;
    
    if not ( IsAlgebraWithOne( A ) or ( HasOne( A ) and not One( A ) = fail ) ) then
        Error( "the algebra does not contain a one\n" );
    fi;
    
    r := RadicalOfAlgebraPowersAsIntersection( A );
    
    if not IsBound( r.2 ) then
        I := DefiningIdealOfUnitaryGroup( F, r.1 );
    else
        I := DefiningIdealOfUnitaryGroup( F, r.1, r.2 );
    fi;
    
    A!.DefiningIdealOfCotangentPartOfUnitaryGroup := [ F, I ];
    
    return I;
    
end );

##
InstallMethod( IsCotangentPartUnionOfAffineSpaces,
        [ IsRing, IsAlgebra ],
        
  function( F, A )
    local I, rad, d;
    
    I := DefiningIdealOfCotangentPartOfUnitaryGroup( F, A );
    
    rad := RadicalDecomposition( I );
    
    d := List( rad, AffineDegree );
    
    if Length( Set( d ) ) > 1 then
        Error( "something went wrong, not all affine degrees coincide\n" );
    fi;
    
    return Set( d ) = [ 1 ];
    
end );

##
InstallMethod( DefiningIdealOfLowerPartOfUnitaryGroup,
        [ IsRing, IsAlgebra ],
        
  function( F, A )
    local r, I;
    
    if IsBound( A!.DefiningIdealOfLowerPartOfUnitaryGroup ) and
       IsIdenticalObj( A!.DefiningIdealOfLowerPartOfUnitaryGroup[1], F ) then
        return A!.DefiningIdealOfLowerPartOfUnitaryGroup[2];
    fi;
    
    if not ( IsAlgebraWithOne( A ) or ( HasOne( A ) and not One( A ) = fail ) ) then
        Error( "the algebra does not contain a one\n" );
    fi;
    
    r := RadicalOfAlgebraPowersAsIntersection( A );
    
    if not IsBound( r.2 ) then
        I := ZeroLeftSubmodule( F );
    else
        I := DefiningIdealOfUnitaryGroup( F, r.2 );
    fi;
    
    A!.DefiningIdealOfLowerPartOfUnitaryGroup := [ F, I ];
    
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
        
        I := DefiningIdealOfUnitaryGroup( F, r.(i), r.(i + 1) );
        d := AffineDegree( I );
        
        if d = 0 then
            Error( "affine degree is zero, something went wrong\n" );
        elif d > 1 then
            return false;
        fi;
    od;
    
    I := DefiningIdealOfUnitaryGroup( F, r.(l) );
    d := AffineDegree( I );
    
    if d = 0 then
        Error( "affine degree is zero, something went wrong\n" );
    elif d > 1 then
        return false;
    fi;
    
    return true;
    
end );
