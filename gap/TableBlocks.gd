#############################################################################
##
##  TableBlocks.gd                                            Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Declarations for table blocks.
##
#############################################################################

#! @Chapter Table blocks

DeclareFilter( "IsManagedByPackageBlocks" );

DeclareGlobalVariable( "LogicalImplicationsForTableBlocks" );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Computes the list of table <A>p</A>-blocks
#!  of the ordinary character table <A>ordtbl</A>
#!  (with <A>p</A>-modular group algebra <A>kG</A>
#!   and <A>p</A>-modular character table <A>modtbl</A>)
#!  of the group <A>G</A>.
#!  (see <Ref Attr="PrimeBlocks" BookName="Reference"/>).
#! @Arguments ordtbl, p
#! @Returns a list of table blocks
#! @Group TableBlocks
DeclareOperation( "TableBlocks",
        [ IsCharacterTable, IsInt ] );

#! @Arguments G, p
#! @Group TableBlocks
DeclareOperation( "TableBlocks",
        [ IsGroup, IsInt ] );

#! @Arguments kG
#! @Group TableBlocks
DeclareAttribute( "TableBlocks",
        IsGroupAlgebra );

#! @Arguments modtbl
#! @Group TableBlocks
DeclareAttribute( "TableBlocks",
        IsBrauerTable );

#! @Description
#!  Computes the principal table <A>p</A>-block
#!  of the ordinary character table <A>ordtbl</A>
#!  (with <A>p</A>-modular group algebra <A>kG</A>
#!   and <A>p</A>-modular character table <A>modtbl</A>)
#!  of the group <A>G</A>.
#! @Arguments ordtbl, p
#! @Returns a list of table blocks
#! @Group PrincipalTableBlock
DeclareOperation( "PrincipalTableBlock",
        [ IsCharacterTable, IsInt ] );

#! @Arguments G, p
#! @Group PrincipalTableBlock
DeclareOperation( "PrincipalTableBlock",
        [ IsGroup, IsInt ] );

#! @Arguments kG
#! @Group PrincipalTableBlock
DeclareAttribute( "PrincipalTableBlock",
        IsGroupAlgebra );

#! @Arguments modtbl
#! @Group PrincipalTableBlock
DeclareAttribute( "PrincipalTableBlock",
        IsBrauerTable );

#! @Description
#!  Computes the list of real table <A>p</A>-blocks
#!  of the ordinary character table <A>ordtbl</A>
#!  (with <A>p</A>-modular group algebra <A>kG</A>
#!   and <A>p</A>-modular character table <A>modtbl</A>)
#!  of the group <A>G</A>.
#! @Arguments ordtbl, p
#! @Returns a list of table blocks
#! @Group RealTableBlocks
DeclareOperation( "RealTableBlocks",
        [ IsCharacterTable, IsInt ] );

#! @Arguments G, p
#! @Group RealTableBlocks
DeclareOperation( "RealTableBlocks",
        [ IsGroup, IsInt ] );

#! @Arguments kG
#! @Group RealTableBlocks
DeclareAttribute( "RealTableBlocks",
        IsGroupAlgebra );

#! @Arguments modtbl
#! @Group RealTableBlocks
DeclareAttribute( "RealTableBlocks",
        IsBrauerTable );

#! @Description
#!  Computes the list of nonprincipal real table <A>p</A>-blocks
#!  of the ordinary character table <A>ordtbl</A>
#!  (with <A>p</A>-modular group algebra <A>kG</A>
#!   and <A>p</A>-modular character table <A>modtbl</A>)
#!  of the group <A>G</A>.
#! @Arguments ordtbl, p
#! @Returns a list of table blocks
#! @Group RealNonPrincipalTableBlocks
DeclareOperation( "RealNonPrincipalTableBlocks",
        [ IsCharacterTable, IsInt ] );

#! @Arguments G, p
#! @Group RealNonPrincipalTableBlocks
DeclareOperation( "RealNonPrincipalTableBlocks",
        [ IsGroup, IsInt ] );

#! @Arguments kG
#! @Group RealNonPrincipalTableBlocks
DeclareAttribute( "RealNonPrincipalTableBlocks",
        IsGroupAlgebra );

#! @Arguments modtbl
#! @Group RealNonPrincipalTableBlocks
DeclareAttribute( "RealNonPrincipalTableBlocks",
        IsBrauerTable );

#! @Description
#!  Computes the list special table <M>2</M>-blocks
#!  of the ordinary character table <A>ordtbl</A>
#!  of the group <A>G</A>.
#! @Arguments ordtbl
#! @Returns a list of table blocks
#! @Group SpecialTableBlocks
DeclareOperation( "SpecialTableBlocks",
        [ IsCharacterTable ] );

#! @Arguments G
#! @Group SpecialTableBlocks
DeclareOperation( "SpecialTableBlocks",
        [ IsGroup ] );

####################################
#
#! @Section Properties
#
####################################

#! @Description
#!  Check if the table block is the principal block.
#! @Arguments B
DeclareProperty( "IsPrincipal",
        IsBlockOfCharacterTable );

#! @Description
#!  Check if the table block is real (=self-dual).
#! @Arguments B
DeclareProperty( "IsReal",
        IsBlockOfCharacterTable );

#! @Description
#!  Check if the table <M>2</M>-block <A>B</A> is strongly real.
#! @Arguments B
DeclareProperty( "IsStronglyReal",
        IsBlockOfCharacterTable );

#! @Description
#!  Check if the table <M>2</M>-block <A>B</A> is special.
#!  The underlying ordinary character table <A>ordtbl</A>
#!  of the group <A>G</A> is special if at least one table <M>2</M>-block is special.
#! @Arguments B
#! @Group IsSpecial
DeclareProperty( "IsSpecial",
        IsBlockOfCharacterTable );

#! @Arguments ordtbl
#! @Group IsSpecial
DeclareProperty( "IsSpecial",
        IsCharacterTable );

#! @Arguments G
#! @Label for IsGroup
#! @Group IsSpecial
DeclareProperty( "IsSpecial",
        IsGroup );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  Computes the dimension of the table <M>p</M>-block <A>B</A>.
#! @Arguments B
#! @Returns a positive integer
DeclareAttribute( "Dimension",
        IsBlockOfCharacterTable );

#! @Description
#!  Computes the O-central character of the table <M>p</M>-block <A>B</A>
#!  as a list indexed by the conjugacy classes of the underlying group <M>G</M>.
#! @Arguments B
#! @Returns a list of finite field elements
DeclareAttribute( "OCentralCharacter",
        IsBlockOfCharacterTable );

#! @Description
#!  Computes the central character of the table <M>p</M>-block <A>B</A>
#!  as a list indexed by the <M>p</M>-regular classes.
#! @Arguments B
#! @Returns a list of finite field elements
DeclareAttribute( "PCentralCharacter",
        IsBlockOfCharacterTable );

#! @Description
#!  Computes the mod <M>p</M> coefficients of the Osima idempotent
#!  of the table <M>p</M>-block <A>B</A> as a list
#!  indexed by the <M>p</M>-regular classes.
#! @Arguments B
#! @Returns a list of finite field elements
DeclareAttribute( "PCoefficientsOfOsimaIdempotent",
        IsBlockOfCharacterTable );

#! @Description
#!  Computes the Frobenius-Schur number <M>\sum_{\chi \in Irr(B)} \nu_2(\chi)\chi(1)</M>
#!  of the table <M>2</M>-block <A>B</A>.
#! @Arguments B
#! @Returns a nonnegative integer
DeclareAttribute( "FrobeniusSchurNumber",
        IsBlockOfCharacterTable );

#! @Description
#!  Computes the finite splitting field
#!  of all special <M>2</M>-blocks of the of the group <A>G</A>
#!  with ordinary character table <A>ordtbl</A>.
#! @Arguments ordtbl
#! @Returns a finite field
#! @Group SpecialSplittingField
DeclareAttribute( "SpecialSplittingField",
        IsCharacterTable );

#! @Arguments G
#! @Group SpecialSplittingField
DeclareAttribute( "SpecialSplittingField",
        IsGroup );

#! @Description
#!  Computes the dual table block of <A>B</A>.
#! @Arguments B
#! @Returns a table block
#! @Group ComplexConjugate
DeclareAttribute( "ComplexConjugate",
        IsBlockOfCharacterTable );

#! @Description
#!  Computes the list of defects of the table <A>p</A>-blocks of the group <A>G</A>
#!  with ordinary character table <A>ordtbl</A>
#!  and <A>p</A>-modular character table <A>modtbl</A>.
#! @Arguments modtbl
#! @Returns a list
#! @Group DefectsOfBlocks
DeclareAttribute( "DefectsOfBlocks",
        IsBrauerTable );
#! @InsertSystem DefectsOfBlocks

#! @Description
#!  Computes the list of degrees of irreducible ordinary characters
#!  associated to the table <A>p</A>-block <A>B</A>.
#! @Arguments B
#! @Returns a list
DeclareAttribute( "OrdinaryCharactersDegrees",
        IsBlockOfCharacterTable );

#! @Description
#!  Computes the list of lists of degrees of irreducible ordinary characters
#!  associated to the table <A>p</A>-blocks of the group <A>G</A>
#!  with ordinary character table <A>ordtbl</A>
#!  and <A>p</A>-modular character table <A>modtbl</A>.
#! @Arguments modtbl
#! @Returns a list
#! @Group OrdinaryCharactersDegrees
DeclareAttribute( "OrdinaryCharactersDegrees",
        IsBrauerTable );
#! @InsertSystem OrdinaryCharactersDegrees

#! @Description
#!  Computes the number <M>|IBr(</M><A>B</A><M>)|</M> of Brauer characters
#!  associated to the table <A>p</A>-block <A>B</A>.
#! @Arguments B
#! @Returns a list
DeclareAttribute( "NrIBr",
        IsBlockOfCharacterTable );

#! @Description
#!  Computes the Brauer table of the table block <A>B</A>.
#! @Arguments B
#! @Returns a Brauer table
DeclareAttribute( "BrauerTable",
        IsBlockOfCharacterTable );

#! @Description
#!  Computes the list of decomposition matrices of the <A>p</A>-blocks of the group <A>G</A>
#!  with ordinary character table <A>ordtbl</A>
#!  and <A>p</A>-modular character table <A>modtbl</A>.
#! @Arguments modtbl
#! @Returns a list
#! @Group DecompositionMatrixPerBlock
DeclareAttribute( "DecompositionMatrixPerBlock",
        IsBrauerTable );
#! @InsertSystem DecompositionMatrixPerBlock

#! @Description
#!  Computes the Cartan matrix of the table <A>p</A>-block <A>B</A>.
#! @Arguments B
#! @Returns a list
DeclareAttribute( "CartanMatrix",
        IsBlockOfCharacterTable );

#! @Description
#!  Computes the list of Cartan matrices of the <A>p</A>-blocks of the group <A>G</A>
#!  with ordinary character table <A>ordtbl</A>
#!  and <A>p</A>-modular character table <A>modtbl</A>.
#! @Arguments modtbl
#! @Returns a list
#! @Group CartanMatrixPerBlock
DeclareAttribute( "CartanMatrixPerBlock",
        IsBrauerTable );
#! @InsertSystem CartanMatrixPerBlock

#! @Description
#!  Computes the list of degrees of Brauer characters
#!  associated to the table <A>p</A>-block <A>B</A>.
#! @Arguments B
#! @Returns a list
DeclareAttribute( "BrauerCharactersDegrees",
        IsBlockOfCharacterTable );

#! @Description
#!  Computes the list of lists of degrees of Brauer characters
#!  associated to the table <A>p</A>-blocks of the group <A>G</A>
#!  with ordinary character table <A>ordtbl</A>
#!  and <A>p</A>-modular character table <A>modtbl</A>.
#! @Arguments modtbl
#! @Returns a list
#! @Group BrauerCharactersDegrees
DeclareAttribute( "BrauerCharactersDegrees",
        IsBrauerTable );
#! @InsertSystem BrauerCharactersDegrees

####################################
#
#! @Section Operations
#
####################################

#! @Description
#!  Computes the number of <A>p</A>-blocks of the group <A>G</A>
#!  with ordinary character table <A>ordtbl</A>.
#! @Arguments ordtbl, p
#! @Group NrBlocks
#! @Returns a positive integer
DeclareOperation( "NrBlocks",
        [ IsCharacterTable, IsInt ] );

#! @Arguments G, p
#! @Group NrBlocks
DeclareOperation( "NrBlocks",
        [ IsGroup, IsInt ] );

#! @Arguments B
#! @Group ComplexConjugate
DeclareOperation( "Involution",
        [ IsBlockOfCharacterTable ] );

#! @Description
#!  Computes the finite splitting field of characteristic <M>p</M>
#!  of the group <A>G</A> with ordinary character table <A>ordtbl</A>.
#! @Arguments ordtbl, p
#! @Returns a finite field
#! @Group SplittingField
DeclareOperation( "SplittingField",
        [ IsCharacterTable, IsInt ] );

#! @Arguments G, p
#! @Group SplittingField
DeclareOperation( "SplittingField",
        [ IsGroup, IsInt ] );

#! @Arguments ordtbl, p
#! @Group DefectsOfBlocks
DeclareOperation( "DefectsOfBlocks",
        [ IsCharacterTable, IsInt ] );

#! @Arguments G, p
#! @Group DefectsOfBlocks
DeclareOperation( "DefectsOfBlocks",
        [ IsGroup, IsInt ] );

#! @Arguments ordtbl, p
#! @Group OrdinaryCharactersDegrees
DeclareOperation( "OrdinaryCharactersDegrees",
        [ IsCharacterTable, IsInt ] );

#! @Arguments G, p
#! @Group OrdinaryCharactersDegrees
DeclareOperation( "OrdinaryCharactersDegrees",
        [ IsGroup, IsInt ] );

#! @Description
#!  Computes the finite splitting field
#!  of the <M>p</M>-modular <E>involutive</E> group algebra
#!  of the group <A>G</A> with ordinary character table <A>ordtbl</A>.
#! @Arguments ordtbl, p
#! @Returns a finite field
#! @Group InvolutionSplittingField
DeclareOperation( "InvolutionSplittingField",
        [ IsCharacterTable, IsInt ] );

#! @Arguments G, p
#! @Group InvolutionSplittingField
DeclareOperation( "InvolutionSplittingField",
        [ IsGroup, IsInt ] );

#! @Description
#!  Computes the <A>p</A>-modular character table
#!  of the ordinary character table <A>ordtbl</A> of the small group <A>G</A>.
#!  Thomas Breuer sent to me the code of this method. Thank you very much Thomas.
#! @Arguments G, p
#! @Returns Brauer table
#! @Label for IsGroup, IsInt
#! @Group BrauerTableOfSmallGroup
DeclareOperation( "BrauerTableOfSmallGroup",
        [ IsGroup, IsInt ] );

#! @Arguments ordtbl, p
#! @Group BrauerTableOfSmallGroup
DeclareOperation( "BrauerTableOfSmallGroup",
        [ IsCharacterTable, IsInt ] );

#! @Arguments ordtbl, p
#! @Group BrauerCharactersDegrees
DeclareOperation( "BrauerCharactersDegrees",
        [ IsCharacterTable, IsInt ] );

#! @Arguments G, p
#! @Group BrauerCharactersDegrees
DeclareOperation( "BrauerCharactersDegrees",
        [ IsGroup, IsInt ] );

#! @Arguments ordtbl, p
#! @Group DecompositionMatrixPerBlock
DeclareOperation( "DecompositionMatrixPerBlock",
        [ IsCharacterTable, IsInt ] );

#! @Arguments G, p
#! @Group DecompositionMatrixPerBlock
DeclareOperation( "DecompositionMatrixPerBlock",
        [ IsGroup, IsInt ] );

#! @Arguments ordtbl, p
#! @Group CartanMatrixPerBlock
DeclareOperation( "CartanMatrixPerBlock",
        [ IsCharacterTable, IsInt ] );

#! @Arguments G, p
#! @Group CartanMatrixPerBlock
DeclareOperation( "CartanMatrixPerBlock",
        [ IsGroup, IsInt ] );
