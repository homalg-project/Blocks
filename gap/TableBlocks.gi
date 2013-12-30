#############################################################################
##
##  TableBlocks.gi                                            Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Implementations for table blocks.
##
#############################################################################

InstallValue( LogicalImplicationsForTableBlocks,
        [
         
         [ IsPrincipal,
           "implies", IsReal ],
         
         [ IsSpecial,
           "implies", IsReal ],
         
         ] );

####################################
#
# methods for properties:
#
####################################

##
InstallLogicalImplicationsForHomalgObjects(
        LogicalImplicationsForTableBlocks,
        IsBlockOfCharacterTable );

##
InstallMethod( IsReal,
        [ "IsBlockOfCharacterTable" ],
        
  function( B )
    local irrB;
    
    irrB := Irr( B );
    
    return not fail = Position( irrB, ComplexConjugate( irrB[1] ) );
    
end );

##
InstallMethod( IsStronglyReal,
        [ "IsBlockOfCharacterTable" ],
        
  function( B )
    
    if not HasUnderlyingCharacteristic( B ) then
        Error( "the characteristic of the table block is not set\n" );
    elif not UnderlyingCharacteristic( B ) = 2 then
        Error( "the characteristic of the table block is not 2\n" );
    fi;
    
    return IsReal( B ) and FrobeniusSchurNumber( B ) > 0;
    
end );

##
InstallMethod( IsSpecial,
        [ "IsBlockOfCharacterTable" ],
        
  function( B )
    
    if not HasUnderlyingCharacteristic( B ) then
        Error( "the characteristic of the table block is not set\n" );
    elif not UnderlyingCharacteristic( B ) = 2 then
        Error( "the characteristic of the table block is not 2\n" );
    fi;
    
    return IsReal( B ) and FrobeniusSchurNumber( B ) = 0;
    
end );

##
InstallMethod( IsSpecial,
        [ "IsCharacterTable" ],
        
  function( ordtbl )
    
    return true in List( TableBlocks( ordtbl, 2 ), IsSpecial );
    
end );

##
InstallMethod( IsSpecial,
        [ "IsGroup" ],
        
  function( G )
    
    return IsSpecial( CharacterTable( G ) );
    
end );

####################################
#
# methods for attributes:
#
####################################

##
InstallMethod( Dimension,
        [ "IsBlockOfCharacterTable" ],
        
  function( B )
    
    return Sum( Irr( B ), chi -> Degree( chi )^2 );
    
end );

##
InstallMethod( OCentralCharacter,
        [ "IsBlockOfCharacterTable" ],
        
  function( B )
    
    return CentralCharacter( Irr( B )[1] );
    
end );

##
InstallMethod( PCentralCharacter,
        [ "IsBlockOfCharacterTable" ],
        
  function( B )
    local omega, p;
    
    omega := OCentralCharacter( B ){B!.pregular};
    
    p := UnderlyingCharacteristic( B );
    
    return List( omega, a -> FrobeniusCharacterValue( a, p ) );
    
end );

##
InstallMethod( PCoefficientsOfOsimaIdempotent,
        [ "IsBlockOfCharacterTable" ],
        
  function( B )
    local p;
    
    p := UnderlyingCharacteristic( B );
    
    return List( CoefficientsOfOsimaIdempotent( B ){B!.pregular},
                 a -> FrobeniusCharacterValue( a, p ) );
    
end );

##
InstallMethod( FrobeniusSchurNumber,
        [ "IsBlockOfCharacterTable" ],
        
  function( B )
    local ordtbl;
    
    ordtbl := UnderlyingCharacterTable( B );
    
    return Sum( Irr( B ), chi -> Indicator( ordtbl, [ chi ], 2 )[1] * Degree( chi ) );
    
end );

##
InstallMethod( ComplexConjugate,
        [ "IsBlockOfCharacterTable" ],
        
  function( B )
    local chi, p, omega, ordtbl, _B;
    
    if IsReal( B ) then
        return B;
    fi;
    
    chi := Irr( B )[1];
    
    chi := ComplexConjugate( chi );
    
    p := UnderlyingCharacteristic( B );
    
    omega := CentralCharacter( chi );
    omega := omega{B!.pregular};
    omega := List( omega, a -> FrobeniusCharacterValue( a, p ) );
    
    ordtbl := UnderlyingCharacterTable( B );
    
    _B := First( TableBlocks( ordtbl, p ),
                 _B -> PCentralCharacter( _B ) = omega );
    
    Assert( 0, IsBlockOfCharacterTable( _B ) );
    
    if not HasComplexConjugate( _B ) then
        SetComplexConjugate( _B, B );
    fi;
    
    return _B;
    
end );

##
InstallMethod( BrauerTable,
        [ "IsBlockOfCharacterTable" ],
        
  function( B )
    
    return BrauerTableOfSmallGroup(
                   UnderlyingCharacterTable( B ),
                   UnderlyingCharacteristic( B ) );
    
end );

####################################
#
# methods for operations:
#
####################################

##
InstallMethod( NrBlocks,
        [ IsCharacterTable, IsInt ],
        
  function( ordtbl, p )
    
    return Length( TableBlocks( ordtbl, p ) );
    
end );

##
InstallMethod( NrBlocks,
        [ IsGroup, IsInt ],
        
  function( G, p )
    
    return NrBlocks( CharacterTable( G ), p );
    
end );

##
InstallMethod( Involution,
        [ "IsBlockOfCharacterTable" ],
        
  ComplexConjugate );

##
InstallMethod( SplittingField,
        [ IsCharacterTable, IsInt ],
        
  function( ordtbl, p )
    
    return Field( Flat( List( TableBlocks( ordtbl, p ), PCoefficientsOfOsimaIdempotent ) ) );
    
end );

##
InstallMethod( SplittingField,
        [ IsGroup, IsInt ],
        
  function( G, p )
    
    return SplittingField( CharacterTable( G ), p );
    
end );

##
InstallMethod( InvolutionSplittingField,
        [ IsCharacterTable, IsInt ],
        
  function( ordtbl, p )
    
    return Field( Flat( List(
                   TableBlocks( ordtbl, p ),
                   function( B )
                     local b;
                     
                     b := PCoefficientsOfOsimaIdempotent( B );
                     
                     if IsReal( B ) then
                         return b;
                     fi;
                     
                     return b + PCoefficientsOfOsimaIdempotent( ComplexConjugate( B ) );
                     
                 end ) ) );
    
end );

##
InstallMethod( InvolutionSplittingField,
        [ IsGroup, IsInt ],
        
  function( G, p )
    
    return InvolutionSplittingField( CharacterTable( G ), p );
    
end );

####################################
#
# constructors:
#
####################################

##
InstallMethod( TableBlocks,
        [ "IsCharacterTable", "IsInt" ],
        
  function( ordtbl, p )
    local pexp, pb, orders, c, pregular, blocks, irr, one, found_principal,
          B, irrB, coheights;
    
    pexp := PrimePowerExponent( Size( ordtbl ), p );
    
    pb := PrimeBlocks( ordtbl, p );
    
    orders := OrdersClassRepresentatives( ordtbl );
    
    c := Length( orders );
    
    pregular := Filtered( [ 1 .. c ], i -> not IsZero( orders[i] mod p ) );
    
    pb!.pregular := MakeImmutable( pregular );
    
    blocks := PBlocks( ordtbl, p );
    
    irr := Irr( ordtbl );
    
    one := TrivialCharacter( ordtbl );
    found_principal := false;
    
    for B in blocks do
        SetFilterObj( B, IsManagedByPackageBlocks );
        B!.pregular := pregular;
        B!.ordchars := Positions( pb.block, NumberOfBlock( B ) );
        irrB := irr{B!.ordchars};
        SetIrr( B, irrB );
        if found_principal then
            SetIsPrincipal( B, false );
        elif one in irrB then
            SetIsPrincipal( B, true );
            found_principal := true;
        fi;
        Dimension( B );
        if p = 2 then
            IsSpecial( B );
        else
            IsReal( B );
        fi;
        coheights := MakeImmutable( List( irrB, chi -> pexp - PrimePowerExponent( Degree( chi ), p ) ) );
        B!.heights := MakeImmutable( Defect( B ) - coheights );
        #SetDefect( B, Maximum( coheights ) );
        Defect( B );
        B!.DefectClassesOrder := MakeImmutable( orders{ClassPositionsOfDefectClasses( B )} );
        B!.SplittingField :=  Field( PCoefficientsOfOsimaIdempotent( B ) );
    od;
    
    MakeImmutable( blocks );
    
    return blocks;
    
end );

##
InstallMethod( TableBlocks,
        [ "IsGroup", "IsInt" ],
        
  function( G, p )
    
    return TableBlocks( CharacterTable( G ), p );
    
end );

##
InstallMethod( TableBlocks,
        [ "IsGroupAlgebra" ],
        
  function( kG )
    
    return TableBlocks( UnderlyingGroup( kG ), Characteristic( kG ) );
    
end );

##
InstallMethod( TableBlocks,
        [ "IsBrauerTable" ],
        
  function( modtbl )
    
    return TableBlocks(
                   OrdinaryCharacterTable( modtbl ),
                   UnderlyingCharacteristic( modtbl ) );
    
end );

##
InstallMethod( RealTableBlocks,
        [ "IsCharacterTable", "IsInt" ],
        
  function( ordtbl, p )
    
    return Filtered( TableBlocks( ordtbl, p ), IsReal );
    
end );

##
InstallMethod( RealTableBlocks,
        [ "IsGroup", "IsInt" ],
        
  function( G, p )
    
    return RealTableBlocks( CharacterTable( G ), p );
    
end );

##
InstallMethod( RealTableBlocks,
        [ "IsGroupAlgebra" ],
        
  function( kG )
    
    return RealTableBlocks( UnderlyingGroup( kG ), Characteristic( kG ) );
    
end );

##
InstallMethod( RealTableBlocks,
        [ "IsBrauerTable" ],
        
  function( modtbl )
    
    return RealTableBlocks(
                   OrdinaryCharacterTable( modtbl ),
                   UnderlyingCharacteristic( modtbl ) );
    
end );

##
InstallMethod( RealNonPrincipalTableBlocks,
        [ "IsCharacterTable", "IsInt" ],
        
  function( ordtbl, p )
    
    return Filtered( RealTableBlocks( ordtbl, p ), b -> not IsPrincipal( b ) );
    
end );

##
InstallMethod( RealNonPrincipalTableBlocks,
        [ "IsGroup", "IsInt" ],
        
  function( G, p )
    
    return RealNonPrincipalTableBlocks( CharacterTable( G ), p );
    
end );

##
InstallMethod( RealNonPrincipalTableBlocks,
        [ "IsGroupAlgebra" ],
        
  function( kG )
    
    return RealNonPrincipalTableBlocks( UnderlyingGroup( kG ), Characteristic( kG ) );
    
end );

##
InstallMethod( RealNonPrincipalTableBlocks,
        [ "IsBrauerTable" ],
        
  function( modtbl )
    
    return RealNonPrincipalTableBlocks(
                   OrdinaryCharacterTable( modtbl ),
                   UnderlyingCharacteristic( modtbl ) );
    
end );

##
InstallMethod( SpecialTableBlocks,
        [ "IsCharacterTable" ],
        
  function( ordtbl )
    
    return Filtered( RealNonPrincipalTableBlocks( ordtbl, 2 ), IsSpecial );
    
end );

##
InstallMethod( SpecialTableBlocks,
        [ "IsGroup" ],
        
  function( G )
    
    return SpecialTableBlocks( CharacterTable( G ) );
    
end );

####################################
#
# View, Print, and Display methods:
#
####################################

##
InstallMethod( ViewObj,
        "for a table block",
        [ IsBlockOfCharacterTable and IsManagedByPackageBlocks ],
        
  function( B )
    
    Print( "<Table " );
    
    if HasIsPrincipal( B ) and IsPrincipal( B ) then
        Print( "principal " );
    fi;
    
    Print( UnderlyingCharacteristic( B ), "-block #", NumberOfBlock( B ) );
    
    if HasDefect( B ) then
        Print( ", defect ", Defect( B ) );
    fi;
    
    if HasDimension( B ) then
        Print( ", dim=", Dimension( B ) );
    fi;
    
    if not ( HasIsPrincipal( B ) and IsPrincipal( B ) )
       and not ( HasIsReal( B ) and IsReal( B ) and HasFrobeniusSchurNumber( B ) )
       and HasIsReal( B ) then
        Print( ", " );
        if not IsReal( B ) then
            Print( "non" );
        fi;
        Print( "real" );
    fi;
    
    if not ( HasIsPrincipal( B ) and IsPrincipal( B ) ) then
        Print( ", ", B!.SplittingField );
    fi;
    
    if not ( HasIsReal( B ) and not IsReal( B ) )
       and HasIsSpecial( B ) then
        Print( ", " );
        if not IsSpecial( B ) then
            if HasFrobeniusSchurNumber( B ) then
                Print( "FS=", FrobeniusSchurNumber( B ) );
            else
                Print( "nonspecial" );
            fi;
        else
            Print( "special" );
        fi;
    fi;
    
    Print( ">" );
    
end );
