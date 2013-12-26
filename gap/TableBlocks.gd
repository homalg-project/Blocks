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
#!  Computes the list of real table <A>p</A>-blocks
#!  of the ordinary character table <A>ordtbl</A>
#!  of the group <A>G</A>.
#!  (see <Ref Attr="PrimeBlocks" BookName="Reference"/>).
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

#! @Description
#!  Computes the list of nonprincipal real table <A>p</A>-blocks
#!  of the ordinary character table <A>ordtbl</A>
#!  of the group <A>G</A>.
#!  (see <Ref Attr="PrimeBlocks" BookName="Reference"/>).
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
#!  as a list indexed by the <M>p</M>-regular classes.
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
#!  Computes the dual table block of <A>B</A>.
#! @Arguments B
#! @Returns a table block
#! @Group ComplexConjugate
DeclareAttribute( "ComplexConjugate",
        IsBlockOfCharacterTable );

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
