#############################################################################
##
##  Groups.gi                                                 Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Implementation stuff for groups.
##
#############################################################################

##
InstallMethod( IsReal,
        [ CategoryCollections(IsMultiplicativeElementWithInverse) ],
        
  function( K )
    
    ## this is efficient by a special method for =
    return K = Involution( K );
    
end );

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
InstallMethod( NumberOfQuadraticEquationsOfUnitaryGroup,
        [ IsGroup ],
        
  function( G )
    local G2;
    
    ## we are dealing with small groups
    G2 := Filtered( List( G ), a -> Order( a ) <= 2 );
    
    return 1/2 * ( Size( G ) - Length( G2 ) );
    
end );

##
InstallMethod( DimensionOfUnitaryGroup,
        [ IsGroup ],
        
  function( G )
    local G2;
    
    ## we are dealing with small groups
    G2 := Filtered( List( G ), a -> Order( a ) <= 2 );
    
    return 1/2 * ( Size( G ) + Length( G2 ) ) - 1;
    
end );

##  <#GAPDoc Label="DefectGroup_code:cc">
##  <Listing Type="Code"><![CDATA[
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
##  ]]></Listing>
##  <#/GAPDoc>

##
InstallMethod( Involution,
        [ CategoryCollections(IsMultiplicativeElementWithInverse) ],
        
  function( K )
    local G, g;
    
    G := ActingDomain( K );
    g := Representative( K );
    
    return ConjugacyClass( G, g^-1 );
    
end );
