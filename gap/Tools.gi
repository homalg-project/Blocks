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
        [ IsHomalgRing, IsRingElement, IsPositionalObjectRep and IsElementOfFreeMagmaRing and IsMagmaRingObjDefaultRep ],
        
  function( F, o, r )
    
    r := CoefficientsAndMagmaElements( r );
    
    r := ListToListList( r, Length( r ) / 2, 2 );
    
    return Sum( r, s -> ( s[2] / F ) * ( o * s[1] ) );
    
end );
