#############################################################################
##
##  Blocks.gd                                                 Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Declaration stuff for blocks.
##
#############################################################################

#! @Chapter Blocks

# our info class:
DeclareInfoClass( "InfoBlocks" );
SetInfoLevel( InfoBlocks, 1 );

# a central place for configurations:
DeclareGlobalVariable( "BLOCKS" );

####################################
#
#! @Section Properties
#
####################################

#! @Description
#!  Check if the ideal <A>B</A> of a group algebra is a block.
#! @Arguments B
#! @Label for IsAlgebra
DeclareProperty( "IsBlock",
        IsAlgebra );

#! @Description
#!  Check if the block <A>B</A> is real.
#! @Arguments B
#! @Label for IsAlgebra
DeclareProperty( "IsReal",
        IsAlgebra );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The group algebra <M>kG</M> containing the algebra <A>B</A> as an ideal of which <A>b</A> is an element
#!  (e.g., <A>B</A> is a block of <M>kG</M> and <A>b</A> its block idempotent).
#! @Arguments B
#! @Returns a group algebra
#! @Label for IsAlgebra
#! @Group UnderlyingGroupAlgebra
DeclareAttribute( "UnderlyingGroupAlgebra",
        IsAlgebra );

#! @Arguments b
#! @Group UnderlyingGroupAlgebra
DeclareAttribute( "UnderlyingGroupAlgebra",
        IsElementOfFreeMagmaRing );
## IsElementOfFreeMagmaRing is not an IsAttributeStoringRep but
## UnderlyingGroupAlgebra was declared as an attribute

#! @Description
#!  The Brauer table of the modular group algebra <M>kG :=</M><C>UnderlyingGroupAlgebra</C>(<A>b</A>)
#!  containing the algebra <M>B</M> as an ideal of which <A>b</A> is an element.
#! @Arguments b
#! @Returns a Brauer table
DeclareAttribute( "UnderlyingBrauerTable",
        IsElementOfFreeMagmaRing );
## IsElementOfFreeMagmaRing is not an IsAttributeStoringRep but
## we want to declare UnderlyingBrauerTable as an attribute

#! @Description
#!  Computes the block of the idempotent <A>e</A> of a group algebra <M>kG</M>.
#! @Arguments e
#! @Returns an algebra with one
DeclareAttribute( "BlockOfIdempotent",
        IsElementOfFreeMagmaRing );
## IsElementOfFreeMagmaRing is not an IsAttributeStoringRep but
## we want to declare BlockOfIdempotent as an attribute

#! @Description
#!  Computes the principal block idempotent of the group algebra <A>kG</A>.
#! @Arguments kG
#! @Returns a ring element
DeclareAttribute( "PrincipalBlockIdempotent",
        IsGroupAlgebra );

#! @Description
#!  Computes the principal block of the group algebra <A>kG</A>.
#! @Arguments kG
#! @Returns an algebra with one
DeclareAttribute( "PrincipalBlock",
        IsGroupAlgebra );
#! @InsertSystem PrincipalBlock

#! @Description
#!  Computes the list of central non-principle primitive idempotents of the group algebra <A>kG</A>,
#!  viewed as an <E>involutive</E> algebra.
#! @Arguments kG
#! @Returns a list
DeclareAttribute( "CentralNonPrincipalIdempotentsOfGroupAlgebra",
        IsGroupAlgebra );

#! @Description
#!  Computes the canonical projection matrix of the
#!  group algebra <M>kG</M> onto the <M>p</M>-block <A>B</A>.
#! @Arguments B
#! @Returns a subgroup
#! @Label for IsAlgebra
DeclareAttribute( "AssociatedProjectionMatrix",
        IsAlgebra );

#! @Description
#!  Computes the canonical projection of the
#!  group algebra <M>kG</M> onto <M>p</M>-block <A>B</A>.
#! @Arguments M
#! @Returns a homalg morphism
DeclareAttribute( "AssociatedProjection",
        IsHomalgModule );
#! @InsertSystem AssociatedProjection

#! @Description
#!  Associates to a <M>p</M>-block idempotent <A>b</A> of a <M>p</M>-block <A>B</A>
#!  of a group <M>G</M> with <A>p</A>-modular character table <M>modtbl</M>
#!  the corresponding record in <C>BlocksInfo</C>(<M>modtbl</M>)
#!  (see <Ref Attr="BlocksInfo" BookName="Reference"/>).
#!  The method computes the central characters of all blocks using <C>CentralCharacters</C>(<M>modtbl</M>)
#!  and searches for the unique central character <M>\omega</M> with <M>\omega</M>(<A>b</A>)<M>=1</M>.
#!  For all other central characters <M>\omega</M>(<A>b</A>)<M>=0</M>
#!  (see <Ref Attr="CentralCharacters"/>).
#! @Arguments b
#! @Returns a record
#! @Group BlocksInfo
DeclareAttribute( "BlocksInfo",
        IsElementOfFreeMagmaRing, "mutable" );

#! @Arguments B
#! @Group BlocksInfo
DeclareAttribute( "BlocksInfo",
        IsAlgebra, "mutable" );

#! @Description
#!  Computes the list of defects of the <A>p</A>-blocks of the group <A>G</A>
#!  with <A>p</A>-modular character table <A>modtbl</A>
#!  and underlying ordinary character table <A>ordtbl</A>.
#! @Arguments modtbl
#! @Returns a list
#! @Group DefectsOfBlocks
DeclareAttribute( "DefectsOfBlocks",
        IsBrauerTable );
#! @InsertSystem DefectsOfBlocks

#! @Description
#!  Computes the list of lists of degrees of ordinary characters
#!  associated to the <A>p</A>-blocks of the group <A>G</A>
#!  with <A>p</A>-modular character table <A>modtbl</A>
#!  and underlying ordinary character table <A>ordtbl</A>.
#! @Arguments modtbl
#! @Returns a list
#! @Group OrdinaryCharactersDegrees
DeclareAttribute( "OrdinaryCharactersDegrees",
        IsBrauerTable );
#! @InsertSystem OrdinaryCharactersDegrees

#! @Description
#!  Computes the list of lists of degrees of Brauer characters
#!  associated to the <A>p</A>-blocks of the group <A>G</A>
#!  with <A>p</A>-modular character table <A>modtbl</A>
#!  and underlying ordinary character table <A>ordtbl</A>.
#! @Arguments modtbl
#! @Returns a list
#! @Group BrauerCharactersDegrees
DeclareAttribute( "BrauerCharactersDegrees",
        IsBrauerTable );
#! @InsertSystem BrauerCharactersDegrees

#! @Description
#!  Computes the list of decomposition matrices of the <A>p</A>-blocks of the group <A>G</A>
#!  with <A>p</A>-modular character table <A>modtbl</A>
#!  and underlying ordinary character table <A>ordtbl</A>.
#! @Arguments modtbl
#! @Returns a list
#! @Group DecompositionMatrixPerBlock
DeclareAttribute( "DecompositionMatrixPerBlock",
        IsBrauerTable );
#! @InsertSystem DecompositionMatrixPerBlock

#! @Description
#!  Computes the list of Cartan matrices of the <A>p</A>-blocks of the group <A>G</A>
#!  with <A>p</A>-modular character table <A>modtbl</A>
#!  and underlying ordinary character table <A>ordtbl</A>.
#! @Arguments modtbl
#! @Returns a list
#! @Group CartanMatrixPerBlock
DeclareAttribute( "CartanMatrixPerBlock",
        IsBrauerTable );
#! @InsertSystem CartanMatrixPerBlock

#! @Description
#!  Computes the central character <M>\omega</M> for each <A>p</A>-block of the group <A>G</A>
#!  with <A>p</A>-modular character table <A>modtbl</A>
#!  and underlying ordinary character table <A>ordtbl</A>.
#!  The method simply applies <C>FrobeniusCharacterValue</C>
#!  to <C>CentralCharacter</C> of an ordinary character (any one) per block
#!  <Cite Key="GM00" Where="p. 457"/>:
#!  <Display>
#!    \omega(K) = \omega_\chi(K)^*
#!  </Display>
#!  (see <Ref Attr="FrobeniusCharacterValue" BookName="Reference"/> and
#!   <Ref Attr="CentralCharacter" BookName="Reference"/>).
#!  The order of the list corresponds to the order in <C>BlocksInfo</C>(<A>modtbl</A>)
#!  (see <Ref Attr="BlocksInfo" BookName="Reference"/>).
#! @Arguments modtbl
#! @Returns a list
#! @Group CentralCharacters
DeclareAttribute( "CentralCharacters",
        IsBrauerTable );
#! @InsertSystem CentralCharacters

#! @Description
#!  Computes the list of defect classes of the <M>p</M>-block idempotent <A>b</A>
#!  of a <M>p</M>-block <A>B</A> of a group <M>G</M>
#!  with <A>p</A>-modular character table <M>modtbl</M>
#!  and underlying ordinary character table <M>ordtbl</M>.
#!  The following code implements <Cite Key="GM00" Where="Lemma 2.1"/>:
#!  <#Include Label="DefectClasses_code">
#! @Arguments b
#! @Returns a list
#! @Group DefectClasses
DeclareAttribute( "DefectClasses",
        IsElementOfFreeMagmaRing );
#! @InsertSystem DefectClasses

#! @Arguments B
#! @Group DefectClasses
DeclareAttribute( "DefectClasses",
        IsAlgebra );

#! @Description
#!  Computes a defect group of the <M>p</M>-block idempotent <A>b</A>
#!  of a group <M>G</M> as a subgroup of <M>G</M>.
#!  <#Include Label="DefectGroup_code">
#! @Arguments b
#! @Returns a subgroup
#! @Group DefectGroup
DeclareAttribute( "DefectGroup",
        IsElementOfFreeMagmaRing );

#! @Description
#!  Computes a defect group of the <M>p</M>-block <A>B</A>
#!  of a group <M>G</M> as a subgroup of <M>G</M>.
#! @Arguments B
#! @Returns a subgroup
#! @Label for IsAlgebra
#! @Group DefectGroup
DeclareAttribute( "DefectGroup",
        IsAlgebra );

####################################
#
#! @Section Operations
#
####################################

#! @Description
#!  Compute the maximal ideal corresponding to the group element <A>g</A>.
#! @Arguments g, M
#! @Returns a &homalg; ideal
#! @Label IsMultiplicativeElementWithInverse, IsHomalgModule
DeclareOperation( "CorrespondingMaximalIdeal",
        [ IsMultiplicativeElementWithInverse, IsHomalgModule ] );

#! @Description
#!  Compute the maximal ideal corresponding to the group element <A>g</A>.
#! @Arguments g, filt
#! @Returns a &homalg; ideal
#! @Label for IsMultiplicativeElementWithInverse, IsHomalgFiltration
DeclareOperation( "CorrespondingMaximalIdeal",
        [ IsMultiplicativeElementWithInverse, IsHomalgFiltration ] );

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

#! @Arguments ordtbl, p
#! @Group CentralCharacters
DeclareOperation( "CentralCharacters",
        [ IsCharacterTable, IsInt ] );

#! @Arguments G, p
#! @Group CentralCharacters
DeclareOperation( "CentralCharacters",
        [ IsGroup, IsInt ] );
