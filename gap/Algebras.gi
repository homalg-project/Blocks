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
        
  function( kG )
    local e;
    
    e := CentralIdempotentsOfAlgebra( kG );
    
    e := List( e, function( c ) if c = Involution( c ) then return c; fi; return c + Involution( c ); end );
    
    e := DuplicateFreeList( e );
    
    Assert( 0, IsOne( Sum( e ) ) );
    
    return e;
    
end );
