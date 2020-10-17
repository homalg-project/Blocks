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

##
InstallMethod( IsVerySpecial,
        [ "IsCharacterTable" ],
        
  function( ordtbl )
    
    return NrCentralInvolutions( ordtbl ) = 1 and IsSpecial( ordtbl );
    
end );

##
InstallMethod( IsVerySpecial,
        [ "IsGroup" ],
        
  function( G )
    
    return NrCentralInvolutions( G ) = 1 and IsSpecial( G );
    
end );

##
InstallMethod( IsVerySpecial,
        [ "IsGroup and HasOrdinaryCharacterTable" ],
        
  function( G )
    
    return IsVerySpecial( CharacterTable( G ) );
    
end );

##
InstallMethod( IsMultiSpecial,
        [ "IsBlockOfCharacterTable" ],
        
  function( B )
    
    if not HasUnderlyingCharacteristic( B ) then
        Error( "the characteristic of the table block is not set\n" );
    elif not UnderlyingCharacteristic( B ) = 2 then
        Error( "the characteristic of the table block is not 2\n" );
    fi;
    
    return IsSpecial( B ) and NrIBr( B ) > 1;
    
end );

##
InstallMethod( IsMultiSpecial,
        [ "IsCharacterTable" ],
        
  function( ordtbl )
    
    return ForAny( SpecialTableBlocks( ordtbl ), IsMultiSpecial );
    
end );

##
InstallMethod( IsMultiSpecial,
        [ "IsGroup" ],
        
  function( G )
    
    return IsMultiSpecial( CharacterTable( G ) );
    
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
InstallMethod( SpecialSplittingField,
        [ IsCharacterTable ],
        
  function( ordtbl )
    local L;
    
    L := SpecialTableBlocks( ordtbl );
    
    if L = [ ] then
        L := [ Z(2) ];
    else
        L := Flat( List( L, PCoefficientsOfOsimaIdempotent ) );
    fi;
    
    return Field( L );
    
end );

##
InstallMethod( SpecialSplittingField,
        [ IsGroup ],
        
  function( G )
    
    return SpecialSplittingField( CharacterTable( G ) );
    
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
InstallMethod( DefectsOfBlocks,
        [ IsBrauerTable ],
        
  function( modtbl )
    
    return List( TableBlocks( modtbl ), Defect );
    
end );

##
InstallMethod( OrdinaryCharactersDegrees,
        [ IsBlockOfCharacterTable ],
        
  function( B )
    
    return List( Irr( B ), Degree );
    
end );

##
InstallMethod( OrdinaryCharactersDegrees,
        [ IsBrauerTable ],
        
  function( modtbl )
    
    return List( TableBlocks( modtbl ), OrdinaryCharactersDegrees );
    
end );

##
InstallMethod( NrIBr,
        [ IsBlockOfCharacterTable ],
        
  function( B )
    
    return DimensionsOfDecompositionMatrix( B )[2];
    
end );

##
InstallMethod( BrauerTable,
        [ "IsBlockOfCharacterTable" ],
        
  function( B )
    
    return BrauerTableOfSmallGroup(
                   UnderlyingCharacterTable( B ),
                   UnderlyingCharacteristic( B ) );
    
end );

## IsManagedByPackageBlocks avoids changing the behavior of CTBlocks
InstallMethod( DecompositionMatrix,
        [ IsBlockOfCharacterTable and IsManagedByPackageBlocks ],
        
  function( B )
    
    ## this triggers the computation of the BrauerTable
    ## using BrauerTableOfSmallGroup, otherwise it might fail
    BrauerTable( B );
    
    TryNextMethod( );
    
end );

##
InstallMethod( DecompositionMatrixPerBlock,
        [ IsBrauerTable ],
        
  function( modtbl )
    
    return List( TableBlocks( modtbl ), DecompositionMatrix );
    
end );

##
InstallMethod( CartanMatrix,
        [ IsBlockOfCharacterTable ],
        
  function( B )
    local decmat;
    
    decmat := DecompositionMatrix( B );
    
    return TransposedMat( decmat ) * decmat;
    
end );

## IsManagedByPackageBlocks avoids changing the behavior of CTBlocks
InstallMethod( IBr,
        [ IsBlockOfCharacterTable and IsManagedByPackageBlocks ],
        
  function( B )
    
    ## this triggers the computation of the BrauerTable
    ## using BrauerTableOfSmallGroup, otherwise it might fail
    BrauerTable( B );
    
    TryNextMethod( );
    
end );

##
InstallMethod( CartanMatrixPerBlock,
        [ IsBrauerTable ],
        
  function( modtbl )
    
    return List( TableBlocks( modtbl ), CartanMatrix );
    
end );

##
InstallMethod( BrauerCharactersDegrees,
        [ IsBlockOfCharacterTable ],
        
  function( B )
    
    return List( IBr( B ), Degree );
    
end );

##
InstallMethod( BrauerCharactersDegrees,
        [ IsBrauerTable ],
        
  function( modtbl )
    
    return List( TableBlocks( modtbl ), BrauerCharactersDegrees );
    
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

##
InstallMethod( DefectsOfBlocks,
        [ IsCharacterTable, IsInt ],
        
  function( ordtbl, p )
    
    return List( TableBlocks( ordtbl, p ), Defect );
    
end );

##
InstallMethod( DefectsOfBlocks,
        [ IsGroup, IsInt ],
        
  function( G, p )
    
    return DefectsOfBlocks( CharacterTable( G ), p );
    
end );

##
InstallMethod( OrdinaryCharactersDegrees,
        [ IsCharacterTable, IsInt ],
        
  function( ordtbl, p )
    
    return List( TableBlocks( ordtbl, p ), OrdinaryCharactersDegrees );
    
end );

##
InstallMethod( OrdinaryCharactersDegrees,
        [ IsGroup, IsInt ],
        
  function( G, p )
    
    return OrdinaryCharactersDegrees( CharacterTable( G ), p );
    
end );

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

##
InstallMethod( DecompositionMatrixPerBlock,
        [ IsCharacterTable, IsInt ],
        
  function( ordtbl, p )
    
    return List( TableBlocks( ordtbl, p ), DecompositionMatrix );
    
end );

##
InstallMethod( DecompositionMatrixPerBlock,
        [ IsGroup, IsInt ],
        
  function( G, p )
    
    return DecompositionMatrixPerBlock( CharacterTable( G ), p );
    
end );

##
InstallMethod( CartanMatrixPerBlock,
        [ IsCharacterTable, IsInt ],
        
  function( ordtbl, p )
    
    return List( TableBlocks( ordtbl, p ), CartanMatrix );
    
end );

##
InstallMethod( CartanMatrixPerBlock,
        [ IsGroup, IsInt ],
        
  function( G, p )
    
    return CartanMatrixPerBlock( CharacterTable( G ), p );
    
end );

##
InstallMethod( BrauerCharactersDegrees,
        [ IsCharacterTable, IsInt ],
        
  function( ordtbl, p )
    
    return List( TableBlocks( ordtbl, p ), BrauerCharactersDegrees );
    
end );

##
InstallMethod( BrauerCharactersDegrees,
        [ IsGroup, IsInt ],
        
  function( G, p )
    
    return BrauerCharactersDegrees( CharacterTable( G ), p );
    
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

    pb := ShallowCopy( pb );
    
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
            if IsSpecial( B ) then
                NrIBr( B );
            fi;
        else
            IsReal( B );
        fi;
        coheights := MakeImmutable( List( irrB, chi -> pexp - PrimePowerExponent( Degree( chi ), p ) ) );
        B!.heights := MakeImmutable( Defect( B ) - coheights );
        #SetDefect( B, Maximum( coheights ) );
        Defect( B );
        #B!.DefectClassesOrder := MakeImmutable( orders{ClassPositionsOfDefectClasses( B )} );
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
InstallMethod( PrincipalTableBlock,
        [ "IsCharacterTable", "IsInt" ],
        
  function( ordtbl, p )
    local B0;
    
    B0 := Filtered( TableBlocks( ordtbl, p ), IsPrincipal );
    
    Assert( 0, Length( B0 ) = 1 );
    
    return B0[1];
    
end );

##
InstallMethod( PrincipalTableBlock,
        [ "IsGroup", "IsInt" ],
        
  function( G, p )
    
    return PrincipalTableBlock( CharacterTable( G ), p );
    
end );

##
InstallMethod( PrincipalTableBlock,
        [ "IsGroupAlgebra" ],
        
  function( kG )
    
    return PrincipalTableBlock( UnderlyingGroup( kG ), Characteristic( kG ) );
    
end );

##
InstallMethod( PrincipalTableBlock,
        [ "IsBrauerTable" ],
        
  function( modtbl )
    
    return PrincipalTableBlock(
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
            if HasNrIBr( B ) then
                Print( "|IBr|=", NrIBr( B ), ", " );
            fi;
            Print( "special" );
        fi;
    fi;
    
    Print( ">" );
    
end );
