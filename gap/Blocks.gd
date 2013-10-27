#############################################################################
##
##  Blocks.gd                                                 Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Declaration stuff for blocks.
##
#############################################################################


# our info class:
DeclareInfoClass( "InfoBlocks" );
SetInfoLevel( InfoBlocks, 1 );

# a central place for configurations:
DeclareGlobalVariable( "BLOCKS" );

####################################
#
# properties:
#
####################################

DeclarePropertyWithDocumentation( "IsBlock",
        IsAlgebra,
        [ "Check if the ideal <A>B</A> of a group algebra",
          " is a block." ],
        "B",
        [ "Blocks", "Properties" ],
        rec( function_label := "for IsAlgebra" )
        );

DeclarePropertyWithDocumentation( "IsReal",
        IsAlgebra,
        [ "Check if the block <A>B</A> is real." ],
        "B",
        [ "Blocks", "Properties" ],
        rec( function_label := "for IsAlgebra" )
        );

####################################
#
# attributes:
#
####################################

DeclareAttributeWithDocumentation( "PrincipalBlockIdempotent",
        IsGroupAlgebra,
        [ "Computes the principal block idempotent of the group algebra <A>kG</A>." ],
        "a ring element",
        "kG",
        [ "Blocks", "Attributes" ]
        );

DeclareAttributeWithDocumentation( "PrincipalBlock",
        IsGroupAlgebra,
        [ "Computes the principal block of the group algebra <A>kG</A>.",
          "<#Include Label=\"PrincipalBlock\">" ],
        "an algebra with one",
        "kG",
        [ "Blocks", "Attributes" ]
        );

DeclareAttributeWithDocumentation( "CentralNonPrincipalIdempotentsOfGroupAlgebra",
        IsGroupAlgebra,
        [ "Computes the list of central non-principle primitive idempotents of the group algebra <A>kG</A>,",
          "viewed as an <E>involutive</E> algebra." ],
        "a list",
        "kG",
        [ "Algebras", "Attributes" ],
        rec( function_label := "for IsAlgebraWithOne" )
        );

DeclareAttributeWithDocumentation( "AssociatedProjectionMatrix",
        IsAlgebra,
        [ "Computes the canonical projection matrix of the",
          "group algebra <M>kG</M> onto <M>p</M>-block <A>B</A>." ],
        "a subgroup",
        "B",
        [ "Blocks", "Attributes" ],
        rec( function_label := "for IsAlgebra" )
        );

DeclareAttributeWithDocumentation( "AssociatedProjection",
        IsHomalgModule,
        [ "Computes the canonical projection of the",
          "group algebra <M>kG</M> onto <M>p</M>-block <A>B</A>.",
          "<#Include Label=\"AssociatedProjection\">" ],
        "a homalg morphism",
        "B",
        [ "Blocks", "Attributes" ]
        );

DeclareAttributeWithDocumentation( "DefectsOfBlocks",
        IsBrauerTable,
        [ "Computes the list of defects of the <A>p</A>-blocks of the group <A>G</A>",
          "with <A>p</A>-modular character table <A>modtbl</A>",
          "and underlying ordinary character table <A>ordtbl</A>." ],
        "a list",
        "modtbl",
        [ "Blocks", "Attributes" ],
        rec( group := "DefectsOfBlocks" )
        );

DeclareAttributeWithDocumentation( "CharacterDegreesOfBlocks",
        IsBrauerTable,
        [ "Computes the list of lists of degrees of ordinary characters",
          "associated to the <A>p</A>-blocks of the group <A>G</A>",
          "with <A>p</A>-modular character table <A>modtbl</A>",
          "and underlying ordinary character table <A>ordtbl</A>." ],
        "a list",
        "modtbl",
        [ "Blocks", "Attributes" ],
        rec( group := "CharacterDegreesOfBlocks" )
        );

DeclareAttributeWithDocumentation( "BrauerCharacterDegreesOfBlocks",
        IsBrauerTable,
        [ "Computes the list of lists of degrees of Brauer characters",
          "associated to the <A>p</A>-blocks of the group <A>G</A>",
          "with <A>p</A>-modular character table <A>modtbl</A>",
          "and underlying ordinary character table <A>ordtbl</A>." ],
        "a list",
        "modtbl",
        [ "Blocks", "Attributes" ],
        rec( group := "BrauerCharacterDegreesOfBlocks" )
        );

DeclareAttributeWithDocumentation( "CartanMatricesOfBlocks",
        IsBrauerTable,
        [ "Computes the list of Cartan matrices of the <A>p</A>-blocks of the group <A>G</A>",
          "with <A>p</A>-modular character table <A>modtbl</A>",
          "and underlying ordinary character table <A>ordtbl</A>." ],
        "a list",
        "modtbl",
        [ "Blocks", "Attributes" ],
        rec( group := "CartanMatricesOfBlocks" )
        );

DeclareAttributeWithDocumentation( "CentralCharactersOfBlocks",
        IsBrauerTable,
        [ "Computes the central character for each <A>p</A>-block of the group <A>G</A>",
          "with <A>p</A>-modular character table <A>modtbl</A>",
          "and underlying ordinary character table <A>ordtbl</A>." ],
        "a list",
        "modtbl",
        [ "Blocks", "Attributes" ],
        rec( group := "CentralCharactersOfBlocks" )
        );

DeclareAttributeWithDoc( "BlockIdempotentInfo",
        IsElementOfFreeMagmaRing, "mutable" :
        description := [ "Associates to a <M>p</M>-block idempotent <A>b</A> of a group <M>G</M>",
          "with <A>p</A>-modular character table <M>modtbl</M>",
          "the corresponding record in <C>BlocksInfo</C>(<M>modtbl</M>)",
          "(&see; <Ref Attr=\"BlocksInfo\" BookName=\"Reference\"/>)." ],
        return_value := "a record",
        arguments := "b",
        chapter_info := [ "Blocks", "Attributes" ],
        group := "BlockIdempotentInfo"
        );

DeclareAttributeWithDocumentation( "DefectClasses",
        IsElementOfFreeMagmaRing,
        [ "Computes the list of defect classes of the <M>p</M>-block idempotent <A>b</A>",
          "of a group <M>G</M>." ],
        "a list",
        "b",
        [ "Blocks", "Attributes" ],
        rec( group := "DefectClasses" )
        );

DeclareAttributeWithDocumentation( "DefectClasses",
        IsBrauerTable,
        [ "Computes the list of defect classes for each <A>p</A>-block of the group <A>G</A>",
          "with <A>p</A>-modular character table <A>modtbl</A>",
          "and underlying ordinary character table <A>ordtbl</A>." ],
        "a list",
        "modtbl",
        [ "Blocks", "Attributes" ],
        rec( group := "DefectClasses" )
        );

DeclareAttributeWithDocumentation( "DefectGroup",
        IsElementOfFreeMagmaRing,
        [ "Computes a defect group of the <M>p</M>-block idempotent <A>b</A>",
          "of a group <M>G</M> as a subgroup of <M>G</M>." ],
        "a subgroup",
        "b",
        [ "Blocks", "Attributes" ],
        rec( group := "DefectGroup" )
        );

DeclareAttributeWithDocumentation( "DefectGroup",
        IsAlgebra,
        [ "Computes a defect group of the <M>p</M>-block <A>B</A>",
          "of a group <M>G</M> as a subgroup of <M>G</M>." ],
        "a subgroup",
        "B",
        [ "Blocks", "Attributes" ],
        rec( group := "DefectGroup",
             function_label := "for IsAlgebra" )
        );

####################################
#
# global functions and operations:
#
####################################

# basic operations:

DeclareOperationWithDocumentation( "BlockOfIdempotent",
        [ IsElementOfFreeMagmaRing ],
        "Computes the block of the idempotent <A>e</A> of a group algebra <M>kG</M>.",
        "an algebra with one",
        "e",
        [ "Blocks", "Operations" ]
        );

DeclareOperationWithDocumentation( "CorrespondingMaximalIdeal",
        [ IsMultiplicativeElementWithInverse, IsHomalgModule ],
        "Compute the maximal ideal corresponding to the group element <A>g</A>.",
        "a &homalg; ideal",
        "g, M",
        [ "Blocks", "Operations" ],
        rec( function_label := "for IsMultiplicativeElementWithInverse, IsHomalgModule" )
        );

DeclareOperationWithDocumentation( "CorrespondingMaximalIdeal",
        [ IsMultiplicativeElementWithInverse, IsHomalgFiltration ],
        "Compute the maximal ideal corresponding to the group element <A>g</A>.",
        "a &homalg; ideal",
        "g, filt",
        [ "Blocks", "Operations" ],
        rec( function_label := "for IsMultiplicativeElementWithInverse, IsHomalgFiltration" )
        );

DeclareOperationWithDocumentation( "DefectsOfBlocks",
        [ IsCharacterTable, IsInt ],
        "",
        "a list",
        "ordtbl, p",
        rec( group := "DefectsOfBlocks" )
        );

DeclareOperationWithDocumentation( "DefectsOfBlocks",
        [ IsGroup, IsInt ],
        "<#Include Label=\"DefectsOfBlocks\">",
        "a list",
        "G, p",
        rec( group := "DefectsOfBlocks" )
        );

DeclareOperationWithDocumentation( "CharacterDegreesOfBlocks",
        [ IsCharacterTable, IsInt ],
        "",
        "a list",
        "ordtbl, p",
        rec( group := "CharacterDegreesOfBlocks" )
        );

DeclareOperationWithDocumentation( "CharacterDegreesOfBlocks",
        [ IsGroup, IsInt ],
        "<#Include Label=\"CharacterDegreesOfBlocks\">",
        "a list",
        "G, p",
        rec( group := "CharacterDegreesOfBlocks" )
        );

DeclareOperationWithDocumentation( "BrauerCharacterDegreesOfBlocks",
        [ IsCharacterTable, IsInt ],
        "",
        "a list",
        "ordtbl, p",
        rec( group := "BrauerCharacterDegreesOfBlocks" )
        );

DeclareOperationWithDocumentation( "BrauerCharacterDegreesOfBlocks",
        [ IsGroup, IsInt ],
        "<#Include Label=\"BrauerCharacterDegreesOfBlocks\">",
        "a list",
        "G, p",
        rec( group := "BrauerCharacterDegreesOfBlocks" )
        );

DeclareOperationWithDocumentation( "CartanMatricesOfBlocks",
        [ IsCharacterTable, IsInt ],
        "",
        "a list",
        "ordtbl, p",
        rec( group := "CartanMatricesOfBlocks" )
        );

DeclareOperationWithDocumentation( "CartanMatricesOfBlocks",
        [ IsGroup, IsInt ],
        "<#Include Label=\"CartanMatricesOfBlocks\">",
        "a list",
        "G, p",
        rec( group := "CartanMatricesOfBlocks" )
        );

DeclareOperationWithDocumentation( "CentralCharactersOfBlocks",
        [ IsCharacterTable, IsInt ],
        "",
        "a list",
        "ordtbl, p",
        rec( group := "CentralCharactersOfBlocks" )
        );

DeclareOperationWithDocumentation( "CentralCharactersOfBlocks",
        [ IsGroup, IsInt ],
        "<#Include Label=\"CentralCharactersOfBlocks\">",
        "a list",
        "G, p",
        rec( group := "CentralCharactersOfBlocks" )
        );

DeclareOperationWithDocumentation( "DefectClasses",
        [ IsCharacterTable, IsInt ],
        "",
        "a list",
        "ordtbl, p",
        rec( group := "DefectClasses" )
        );

DeclareOperationWithDocumentation( "DefectClasses",
        [ IsGroup, IsInt ],
        ## "<#Include Label=\"DefectClasses\">",
        "",
        "a list",
        "G, p",
        rec( group := "DefectClasses" )
        );
