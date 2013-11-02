#############################################################################
##
##  UnitaryGroup.gi                                           Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Implementation stuff for tools.
##
#############################################################################

####################################
#
# methods for properties:
#
####################################

##
InstallMethod( IsMiddlePartUnionOfAffineSpaces,
        [ IsAlgebra and HasCoefficientsRingForPolynomialAlgebra ],
        
  function( B )
    local k;
    
    k := CoefficientsRingForPolynomialAlgebra( B );
    
    return IsMiddlePartUnionOfAffineSpaces( k, B );
    
end );

##
InstallMethod( IsLowerPartExtensionOfAffineSpaces,
        [ IsAlgebra and HasCoefficientsRingForPolynomialAlgebra ],
        
  function( B )
    local k;
    
    k := CoefficientsRingForPolynomialAlgebra( B );
    
    return IsLowerPartExtensionOfAffineSpaces( k, B );
    
end );

####################################
#
# methods for attributes:
#
####################################

##
InstallMethod( NumberOfQuadraticEquationsOfUnitaryGroup,
        [ IsGroupAlgebra ],
        
  function( kG )
    local k, G, G2;
    
    k := LeftActingDomain( kG );
    
    if not ( HasCharacteristic( k ) and Characteristic( k ) = 2 ) then
        TryNextMethod( );
    fi;
    
    if not ( HasUnderlyingMagma( kG ) and IsGroup( UnderlyingMagma( kG ) ) ) then
        TryNextMethod( );
    fi;
    
    G := UnderlyingMagma( kG );
    
    G2 := Filtered( ConjugacyClasses( G ),
                  a -> Order( Representative( a ) ) <= 2 );
    
    return 1/2 * ( Size( G ) - Sum( G2, Size ) );
    
end );

##
InstallMethod( DimensionOfUnitaryGroup,
        [ IsGroupAlgebra ],
        
  function( kG )
    local k, G, G2;
    
    k := LeftActingDomain( kG );
    
    if not ( HasCharacteristic( k ) and Characteristic( k ) = 2 ) then
        TryNextMethod( );
    fi;
    
    if not ( HasUnderlyingMagma( kG ) and IsGroup( UnderlyingMagma( kG ) ) ) then
        TryNextMethod( );
    fi;
    
    G := UnderlyingMagma( kG );
    
    G2 := Filtered( ConjugacyClasses( G ),
                  a -> Order( Representative( a ) ) <= 2 );
    
    return 1/2 * ( Size( G ) + Sum( G2, Size ) ) - 1;
    
end );

##
InstallMethod( DefiningIdealOfUnitaryGroup,
        [ IsAlgebra and HasCoefficientsRingForPolynomialAlgebra ],
        
  function( B )
    local k;
    
    k := CoefficientsRingForPolynomialAlgebra( B );
    
    return DefiningIdealOfUnitaryGroup( k, B );
    
end );

##
InstallMethod( DefiningIdealOfUpperPartOfUnitaryGroup,
        [ IsAlgebra and HasCoefficientsRingForPolynomialAlgebra ],
        
  function( B )
    local k;
    
    k := CoefficientsRingForPolynomialAlgebra( B );
    
    return DefiningIdealOfUpperPartOfUnitaryGroup( k, B );
    
end );

##
InstallMethod( DefiningIdealOfMiddlePartOfUnitaryGroup,
        [ IsAlgebra and HasCoefficientsRingForPolynomialAlgebra ],
        
  function( B )
    local k;
    
    k := CoefficientsRingForPolynomialAlgebra( B );
    
    return DefiningIdealOfMiddlePartOfUnitaryGroup( k, B );
    
end );

##
InstallMethod( DefiningIdealOfMiddlePartOfUnitaryGroupUsingAdaptedBasis,
        [ IsAlgebra and HasCoefficientsRingForPolynomialAlgebra ],
        
  function( B )
    local k;
    
    k := CoefficientsRingForPolynomialAlgebra( B );
    
    return DefiningIdealOfMiddlePartOfUnitaryGroupUsingAdaptedBasis( k, B );
    
end );

##
InstallMethod( DefiningIdealOfRadicalPartOfUnitaryGroup,
        [ IsAlgebra and HasCoefficientsRingForPolynomialAlgebra ],
        
  function( B )
    local k;
    
    k := CoefficientsRingForPolynomialAlgebra( B );
    
    return DefiningIdealOfRadicalPartOfUnitaryGroup( k, B );
    
end );

##
InstallMethod( DefiningIdealOfLowerPartOfUnitaryGroup,
        [ IsAlgebra and HasCoefficientsRingForPolynomialAlgebra ],
        
  function( B )
    local k;
    
    k := CoefficientsRingForPolynomialAlgebra( B );
    
    return DefiningIdealOfLowerPartOfUnitaryGroup( k, B );
    
end );

####################################
#
# methods for operations:
#
####################################

##
InstallMethod( NormalizedUnitaryGroup,
        [ IsGroupRing ],
        
  function( kG )
    
    return UnitarySubgroup( NormalizedUnitGroup( kG ) );
    
end );

##
InstallMethod( NormalizedUnitaryGroup,
        [ IsField, IsGroup ],
        
  function( k, G )
    
    return NormalizedUnitaryGroup( GroupRing( k, G ) );
    
end );

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
InstallMethod( SizeOfUnitaryGroupOfGroupRing,
        [ IsRing, IsGroup ],

  function( F, G )
    local k, kG, I;
    
    k := GF( Characteristic( F )^DegreeOverPrimeField( F ) );
    
    kG := GroupRing( k, G );
    
    I := DefiningIdealOfUnitaryGroup( F, kG );
    
    return AffineDegree( IdealOfRationalPoints( I, F ) );
    
end );

## this is inspired by Bovdi and Ross
InstallMethod( NaiveSizeOfUnitaryGroupOfGroupRing,
        [ IsRing, IsGroup ],

  function( F, G )
    local c, G_G0, dim, K;
    
    c := Characteristic( F );
    
    if not c = 2 then
        TryNextMethod( );
    fi;
    
    G_G0 := Size( SerreFactorGroup( G ) );
    
    dim := DimensionOfUnitaryGroup( G );
    
    K := c^DegreeOverPrimeField( F );
    
    return G_G0 * K^dim;
    
end );

##
InstallMethod( DefiningIdealOfUnitary,
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
    
    return DefiningIdealOfUnitary( filt );
    
end );

##
InstallMethod( DefiningIdealOfUnitaryGroup,
        [ IsRing, IsList ],
        
  function( F, L )
    local filt;
    
    filt := InducedFiltration( F, L );
    
    return DefiningIdealOfUnitary( filt );
    
end );

##
InstallMethod( DefiningIdealOfUnitaryGroup,
        [ IsRing, IsAlgebra, IsAlgebra ],
        
  function( F, I, J )
    
    return DefiningIdealOfUnitaryGroup( F, [ I, J ] );
    
end );

##
InstallMethod( DefiningIdealOfUpperPartOfUnitaryGroup,
        [ IsRing, IsAlgebra ],
        
  function( F, A )
    local r, I;
    
    if IsBound( A!._DefiningIdealOfUpperPartOfUnitaryGroup ) and
       IsIdenticalObj( A!._DefiningIdealOfUpperPartOfUnitaryGroup[1], F ) then
        return A!._DefiningIdealOfUpperPartOfUnitaryGroup[2];
    fi;
    
    if not ( IsAlgebraWithOne( A ) or ( HasOne( A ) and not One( A ) = fail ) ) then
        Error( "the algebra does not contain a one\n" );
    fi;
    
    r := RadicalOfAlgebraPowersAsIntersection( A );
    
    ## astonishingly, a basis adapted to the complete filtration
    ## leads for F_2[C_16] to much slower computations than the one
    ## adapted to the 2-step subfiltration
    #I := DefiningIdealOfUnitaryGroup( F, r );
    
    I := DefiningIdealOfUnitaryGroup( F, r.0, r.1 );
    
    A!._DefiningIdealOfUpperPartOfUnitaryGroup := [ F, I ];
    
    return I;
    
end );

##
InstallMethod( DefiningIdealOfRadicalPartOfUnitaryGroup,
        [ IsRing, IsAlgebra ],
        
  function( F, A )
    local r, I;
    
    if IsBound( A!._DefiningIdealOfRadicalPartOfUnitaryGroup ) and
       IsIdenticalObj( A!._DefiningIdealOfRadicalPartOfUnitaryGroup[1], F ) then
        return A!._DefiningIdealOfRadicalPartOfUnitaryGroup[2];
    fi;
    
    if not ( IsAlgebraWithOne( A ) or ( HasOne( A ) and not One( A ) = fail ) ) then
        Error( "the algebra does not contain a one\n" );
    fi;
    
    r := RadicalOfAlgebraPowersAsIntersection( A );
    
    I := DefiningIdealOfUnitaryGroup( F, r.1 );
    
    A!._DefiningIdealOfRadicalPartOfUnitaryGroup := [ F, I ];
    
    return I;
    
end );

##
InstallMethod( DefiningIdealOfMiddlePartOfUnitaryGroup,
        [ IsRing, IsAlgebra ],
        
  function( F, A )
    local r, I;
    
    if IsBound( A!._DefiningIdealOfMiddlePartOfUnitaryGroup ) and
       IsIdenticalObj( A!._DefiningIdealOfMiddlePartOfUnitaryGroup[1], F ) then
        return A!._DefiningIdealOfMiddlePartOfUnitaryGroup[2];
    fi;
    
    if not ( IsAlgebraWithOne( A ) or ( HasOne( A ) and not One( A ) = fail ) ) then
        Error( "the algebra does not contain a one\n" );
    fi;
    
    r := RadicalOfAlgebraPowersAsIntersection( A );
    
    if not IsBound( r.2 ) then
        I := DefiningIdealOfUnitaryGroup( F, r.1 );
    else
        I := DefiningIdealOfUnitaryGroup( F, r.1, r.2 );
        
        ## astonishingly, a basis adapted to the complete filtration
        ## leads for F_2[A_5] to much slower computations than the one
        ## adapted to the 2-step subfiltration
        #r := ShallowCopy( r );
        #Unbind( r.0 );
        #I := DefiningIdealOfUnitaryGroup( F, r );
    fi;
    
    A!._DefiningIdealOfMiddlePartOfUnitaryGroup := [ F, I ];
    
    return I;
    
end );

##
InstallMethod( DefiningIdealOfMiddlePartOfUnitaryGroupUsingAdaptedBasis,
        [ IsRing, IsAlgebra ],
        
  function( F, A )
    local r, I;
    
    if IsBound( A!._DefiningIdealOfMiddlePartOfUnitaryGroup ) and
       IsIdenticalObj( A!._DefiningIdealOfMiddlePartOfUnitaryGroup[1], F ) then
        return A!._DefiningIdealOfMiddlePartOfUnitaryGroup[2];
    fi;
    
    if not ( IsAlgebraWithOne( A ) or ( HasOne( A ) and not One( A ) = fail ) ) then
        Error( "the algebra does not contain a one\n" );
    fi;
    
    r := RadicalOfAlgebraPowersAsIntersection( A );
    
    if not IsBound( r.2 ) then
        I := DefiningIdealOfUnitaryGroup( F, r.1 );
    else
        ## instead of:
        #I := DefiningIdealOfUnitaryGroup( F, r.1, r.2 );
        
        ## a basis adapted to the complete filtration leads
        ## for F_2[SL(2,3)] to a set of defining relations
        ## of the defining ideal of the codomain of the defining morphism.
        ## The Gröbner basis computation of this set is much faster than when
        ## the basis is adapted to the 2-step subfiltration;
        ## with the new version of MatricesForHomalg 2013.10.25 this particular
        ## Gröbner basis computation is avoided and the difference in speed
        ## between subsequent computations with both bases is negligible
        r := ShallowCopy( r );
        Unbind( r.0 );
        I := DefiningIdealOfUnitaryGroup( F, r );
        
    fi;
    
    A!._DefiningIdealOfMiddlePartOfUnitaryGroup := [ F, I ];
    
    return I;
    
end );

##
InstallMethod( IsMiddlePartUnionOfAffineSpaces,
        [ IsRing, IsAlgebra ],
        
  function( F, A )
    local I, rad, d;
    
    I := DefiningIdealOfMiddlePartOfUnitaryGroup( F, A );
    
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
    
    if IsBound( A!._DefiningIdealOfLowerPartOfUnitaryGroup ) and
       IsIdenticalObj( A!._DefiningIdealOfLowerPartOfUnitaryGroup[1], F ) then
        return A!._DefiningIdealOfLowerPartOfUnitaryGroup[2];
    fi;
    
    if not ( IsAlgebraWithOne( A ) or ( HasOne( A ) and not One( A ) = fail ) ) then
        Error( "the algebra does not contain a one\n" );
    fi;
    
    r := RadicalOfAlgebraPowersAsIntersection( A );
    
    if not IsBound( r.2 ) or Dimension( r.2 ) = 0 then
        I := ZeroLeftSubmodule( F );
    else
        I := DefiningIdealOfUnitaryGroup( F, r.2 );
    fi;
    
    A!._DefiningIdealOfLowerPartOfUnitaryGroup := [ F, I ];
    
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
    r := ShallowCopy( r );
    
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
    
    Unbind( r.0 );
    
    for i in powers{[ 2 .. l - 1 ]} do
        
        ## instead of:
        #I := DefiningIdealOfUnitaryGroup( F, r.(i), r.(i + 1) );
        
        ## a basis adapted to the complete filtration
        ## leads to much faster computations than the one
        ## adapted to the 2-step subfiltration
        Unbind( r.(i - 1) );
        I := DefiningIdealOfUnitaryGroup( F, r );
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
