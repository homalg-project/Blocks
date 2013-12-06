#############################################################################
##
##  Groups.gi                                                 Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Implementation stuff for groups.
##
#############################################################################

####################################
#
# methods for properties:
#
####################################

##
InstallMethod( IsReal,
        [ CategoryCollections(IsMultiplicativeElementWithInverse) and
          IsExternalSet ],
        
  function( K )
    
    ## this is efficient by a special method for =
    return K = Involution( K );
    
end );

####################################
#
# methods for attributes:
#
####################################

##
InstallMethod( SerreCharacteristicSubgroup,
        [ IsGroup ],
        
  function( G )
    local L;
    
    L := List( G );
    
    ## this naive procedure is enough for our small group orders
    return Subgroup( G, Concatenation(
                   List( L, g -> g^2 ),
                   Filtered( L, g -> Order( g ) = 2 )
                   ) );
    
end );

##
InstallMethod( SerreFactorGroup,
        [ IsGroup ],
        
  function( G )
    
    return G / SerreCharacteristicSubgroup( G );
    
end );

##
InstallMethod( ConjugacyClassesOfNormalSubgroup,
        [ IsGroup and HasParentAttr ],
        
  function( N )
    local G, KK;
    
    G := Parent( N );
    
    KK := ConjugacyClasses( G );
    
    return Filtered( KK, K -> Representative( K ) in N );
    
end );

##
InstallMethod( ConjugacyClassesOfComplementOfNormalSubgroup,
        [ IsGroup and HasParentAttr ],
        
  function( N )
    local G, KK;
    
    G := Parent( N );
    
    KK := ConjugacyClasses( G );
    
    return Difference( KK, ConjugacyClassesOfNormalSubgroup( N ) );
    
end );

##
InstallMethod( ConjugacyInvolutoryClassesOfComplementOfNormalSubgroup,
        [ IsGroup and HasParentAttr ],
        
  function( N )
    local KK;
    
    KK := ConjugacyClassesOfComplementOfNormalSubgroup( N );
    
    KK := List( KK,
                function( K )
                  local iK;
                  iK := Involution( K );
                  if K = iK then
                      return [ K ];
                  else
                      return Set( [ K, iK ] );
                  fi;
                end );
    
    return Set( KK );
    
end );

####################################
#
# methods for operations:
#
####################################

##
InstallMethod( BrauerTableOfSmallGroup,
        [ IsGroup, IsInt ],
        
  function( G, p )
    local t, tmodp, fus, ccl, cclreps, cclrepsorders, lcm, q, reps, irr;
    
    t:= CharacterTable( G );
    
    tmodp := BrauerTable( G, p );
    
    if not tmodp = fail then
        return tmodp;
    fi;
    
    tmodp:= CharacterTableRegular( t, p );
    
    fus:= FusionConjugacyClasses( tmodp, t );
    
    ccl:= ConjugacyClasses( t ){ fus };
    
    cclreps:= List( ccl, Representative );
    
    cclrepsorders:= List( cclreps, Order );
    
    lcm:= Lcm( cclrepsorders );
    
    q:= p;
    
    while not ( q-1 ) mod lcm = 0 do
        q:= p * q;
    od;
    
    reps:= IrreducibleRepresentations( G, GF(q) );
    
    irr:= List( reps,
                rho -> List( cclreps, x -> BrauerCharacterValue( x^rho ) ) );
    
    SetIrr( tmodp, List( irr, chi -> Character( tmodp, chi ) ) );
    
    ComputedBrauerTables( t )[p] := tmodp;
    
    return tmodp;
    
end );

##
InstallMethod( BrauerTableOfSmallGroup,
        [ IsCharacterTable, IsInt ],
        
  function( ordtbl, p )
    local tmodp, G;
    
    tmodp := ordtbl mod p;
    
    if not tmodp = fail then
        return tmodp;
    elif not HasUnderlyingGroup( ordtbl ) then
        TryNextMethod( );
    fi;
    
    G := UnderlyingGroup( ordtbl );
    
    return BrauerTableOfSmallGroup( G, p );
    
end );

#! @Code IsRegular_code
InstallMethod( IsRegular,
        [ IsMultiplicativeElementWithInverse, IsInt ],
        
  function( g, p )
    
    if not IsPrime( p ) then
        Error( "the second argument must be a prime\n" );
    fi;
    
    return Gcd( Order( g ), p ) in [ 1, -1 ];
    
end );
#! @EndCode

##
InstallMethod( IsRegular,
        [ CategoryCollections(IsMultiplicativeElementWithInverse), IsInt ],
        
  function( K, p )
    local g;
    
    g := Representative( K );
    
    return IsRegular( g, p );
    
end );

#! @Code DefectGroup_code:cc
InstallMethod( DefectGroup,
        [ CategoryCollections(IsMultiplicativeElementWithInverse), IsInt ],
        
  function( K, p )
    local G, g;
    
    if not IsPrime( p ) then
        Error( "the second argument must be a prime\n" );
    fi;
    
    G := ActingDomain( K );
    g := Representative( K );
    
    return SylowSubgroup( Centralizer( G, g ), p );
    
end );
#! @EndCode

##
InstallMethod( Involution,
        [ CategoryCollections(IsMultiplicativeElementWithInverse) ],
        
  function( K )
    local G, g;
    
    G := ActingDomain( K );
    g := Representative( K );
    
    return ConjugacyClass( G, g^-1 );
    
end );

##
InstallMethod( Coefficient,
        [ IsElementOfFreeMagmaRing, IsMultiplicativeElementWithInverse ],
        
  function( b, g )
    local coeffs, pos;
    
    coeffs := CoefficientsAndMagmaElements( b );
    
    pos := Position( coeffs, g );
    
    if pos = fail then
        return Zero( coeffs[2] );
    fi;
    
    return coeffs[pos + 1];
    
end );

##
InstallMethod( Coefficient,
        [ IsElementOfFreeMagmaRing, CategoryCollections(IsMultiplicativeElementWithInverse) ],
        
  function( b, K )
    
    return Coefficient( b, Representative( K ) );
    
end );

##
InstallMethod( Coefficients,
        [ IsElementOfFreeMagmaRing ],
        
  function( b )
    local modtbl, classes;
    
    modtbl := BrauerTable( b );
    
    classes := ConjugacyClasses( OrdinaryCharacterTable( modtbl ) );
    
    return List( classes, K -> Coefficient( b, K ) );
    
end );

##
InstallMethod( ConjugacyInvolutoryClassesOfComplementOfNormalSubgroup,
        [ IsAlgebra, IsGroup and HasParentAttr ],
        
  function( kG, N )
    local KK, o;
    
    KK := ConjugacyInvolutoryClassesOfComplementOfNormalSubgroup( N );
    
    KK := List( KK, s -> List( s, List ) );
    
    o := One( kG );
    
    return List( KK, k -> List( List( k, g -> o * g ), Sum ) );
    
end );
