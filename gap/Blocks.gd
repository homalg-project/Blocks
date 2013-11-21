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
#!  group algebra <M>kG</M> onto <M>p</M>-block <A>B</A>.
#! @Arguments B
#! @Returns a subgroup
#! @Label for IsAlgebra
DeclareAttribute( "AssociatedProjectionMatrix",
        IsAlgebra );

#! @Description
#!  Computes the canonical projection of the
#!  group algebra <M>kG</M> onto <M>p</M>-block <A>B</A>.
#! @Arguments B
#! @Returns a homalg morphism
DeclareAttribute( "AssociatedProjection",
        IsHomalgModule );
#! @InsertSystem AssociatedProjection

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
#! @Group CharacterDegreesOfBlocks
DeclareAttribute( "CharacterDegreesOfBlocks",
        IsBrauerTable );
#! @InsertSystem CharacterDegreesOfBlocks

#! @Description
#!  Computes the list of lists of degrees of Brauer characters
#!  associated to the <A>p</A>-blocks of the group <A>G</A>
#!  with <A>p</A>-modular character table <A>modtbl</A>
#!  and underlying ordinary character table <A>ordtbl</A>.
#! @Arguments modtbl
#! @Returns a list
#! @Group BrauerCharacterDegreesOfBlocks
DeclareAttribute( "BrauerCharacterDegreesOfBlocks",
        IsBrauerTable );
#! @InsertSystem BrauerCharacterDegreesOfBlocks

#! @Description
#!  Computes the list of Cartan matrices of the <A>p</A>-blocks of the group <A>G</A>
#!  with <A>p</A>-modular character table <A>modtbl</A>
#!  and underlying ordinary character table <A>ordtbl</A>.
#! @Arguments modtbl
#! @Returns a list
#! @Group CartanMatricesOfBlocks
DeclareAttribute( "CartanMatricesOfBlocks",
        IsBrauerTable );
#! @InsertSystem CartanMatricesOfBlocks

#! @Description
#!  Computes the central character for each <A>p</A>-block of the group <A>G</A>
#!  with <A>p</A>-modular character table <A>modtbl</A>
#!  and underlying ordinary character table <A>ordtbl</A>.
#! @Arguments modtbl
#! @Returns a list
#! @Group CentralCharactersOfBlocks
DeclareAttribute( "CentralCharactersOfBlocks",
        IsBrauerTable );
#! @InsertSystem CentralCharactersOfBlocks

#! @Description
#!  Associates to a <M>p</M>-block idempotent <A>b</A> of a group <M>G</M>
#!  with <A>p</A>-modular character table <M>modtbl</M>
#!  the corresponding record in <C>BlocksInfo</C>(<M>modtbl</M>)
#!  (see <Ref Attr="BlocksInfo" BookName="Reference"/>).
#! @Arguments b
#! @Returns a record
#! @Group BlockIdempotentInfo
DeclareAttribute( "BlockIdempotentInfo",
        IsElementOfFreeMagmaRing, "mutable" );

#! @Description
#!  Computes the list of defect classes of the <M>p</M>-block idempotent <A>b</A>
#!  of a group <M>G</M>.
#! @Arguments b
#! @Returns a list
#! @Group DefectClasses
DeclareAttribute( "DefectClasses",
        IsElementOfFreeMagmaRing );

#! @Description
#!  Computes the list of defect classes for each <A>p</A>-block of the group <A>G</A>
#!  with <A>p</A>-modular character table <A>modtbl</A>
#!  and underlying ordinary character table <A>ordtbl</A>.
#!  The following code implements <Cite Key="GM00" Where="Lemma 2.1"/>.
#!  <#Include Label="DefectClasses_code">
#! @Arguments modtbl
#! @Returns a list
#! @Group DefectClasses
DeclareAttribute( "DefectClasses",
        IsBrauerTable );
#! @InsertSystem DefectClasses

#! @Description
#!  Computes a defect group of the <M>p</M>-block idempotent <A>b</A>
#!  of a group <M>G</M> as a subgroup of <M>G</M>.
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
#!  Computes the block of the idempotent <A>e</A> of a group algebra <M>kG</M>.
#! @Arguments e
#! @Returns an algebra with one
DeclareOperation( "BlockOfIdempotent",
        [ IsElementOfFreeMagmaRing ] );

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
#! @Group CharacterDegreesOfBlocks
DeclareOperation( "CharacterDegreesOfBlocks",
        [ IsCharacterTable, IsInt ] );

#! @Arguments G, p
#! @Group CharacterDegreesOfBlocks
DeclareOperation( "CharacterDegreesOfBlocks",
        [ IsGroup, IsInt ] );

#! @Arguments ordtbl, p
#! @Group BrauerCharacterDegreesOfBlocks
DeclareOperation( "BrauerCharacterDegreesOfBlocks",
        [ IsCharacterTable, IsInt ] );

#! @Arguments G, p
#! @Group BrauerCharacterDegreesOfBlocks
DeclareOperation( "BrauerCharacterDegreesOfBlocks",
        [ IsGroup, IsInt ] );

#! @Arguments ordtbl, p
#! @Group CartanMatricesOfBlocks
DeclareOperation( "CartanMatricesOfBlocks",
        [ IsCharacterTable, IsInt ] );

#! @Arguments G, p
#! @Group CartanMatricesOfBlocks
DeclareOperation( "CartanMatricesOfBlocks",
        [ IsGroup, IsInt ] );

#! @Arguments ordtbl, p
#! @Group CentralCharactersOfBlocks
DeclareOperation( "CentralCharactersOfBlocks",
        [ IsCharacterTable, IsInt ] );

#! @Arguments G, p
#! @Group CentralCharactersOfBlocks
DeclareOperation( "CentralCharactersOfBlocks",
        [ IsGroup, IsInt ] );

#! @Arguments ordtbl, p
#! @Group DefectClasses
DeclareOperation( "DefectClasses",
        [ IsCharacterTable, IsInt ] );

#! @Arguments G, p
#! @Group DefectClasses
DeclareOperation( "DefectClasses",
        [ IsGroup, IsInt ] );
