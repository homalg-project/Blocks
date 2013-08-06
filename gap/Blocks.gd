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
# global functions and operations:
#
####################################

# basic operations:

DeclareOperationWithDocumentation( "DefectsOfBlocks",
        [ IsCharacterTable, IsInt ],
        [ "Computes the list of defects of the <A>p</A>-blocks of the group <A>G</A>",
          "or the underlying ordinary character table <A>tbl</A>." ],
        "a list",
        "tbl, p",
        [ "Blocks", "Operations" ],
        rec( group := "DefectsOfBlocks" )
        );

DeclareOperationWithDocumentation( "DefectsOfBlocks",
        [ IsGroup, IsInt ],
        "<#Include Label=\"DefectsOfBlocks\">",
        "a list",
        "G, p",
        [ "Blocks", "Operations" ],
        rec( group := "DefectsOfBlocks" )
        );

DeclareOperationWithDocumentation( "CharacterDegreesOfBlocks",
        [ IsCharacterTable, IsInt ],
        [ "Computes the list of lists of degrees of ordinary characters",
          "associated to the <A>p</A>-blocks of the group <A>G</A>",
          "or the underlying ordinary character table <A>tbl</A>." ],
        "a list",
        "tbl, p",
        [ "Blocks", "Operations" ],
        rec( group := "CharacterDegreesOfBlocks" )
        );

DeclareOperationWithDocumentation( "CharacterDegreesOfBlocks",
        [ IsGroup, IsInt ],
        "<#Include Label=\"CharacterDegreesOfBlocks\">",
        "a list",
        "G, p",
        [ "Blocks", "Operations" ],
        rec( group := "CharacterDegreesOfBlocks" )
        );

DeclareOperationWithDocumentation( "BrauerCharacterDegreesOfBlocks",
        [ IsCharacterTable, IsInt ],
        [ "Computes the list of lists of degrees of Brauer characters",
          "associated to the <A>p</A>-blocks of the group <A>G</A>",
          "or the underlying ordinary character table <A>tbl</A>." ],
        "a list",
        "tbl, p",
        [ "Blocks", "Operations" ],
        rec( group := "BrauerCharacterDegreesOfBlocks" )
        );

DeclareOperationWithDocumentation( "BrauerCharacterDegreesOfBlocks",
        [ IsGroup, IsInt ],
        "<#Include Label=\"BrauerCharacterDegreesOfBlocks\">",
        "a list",
        "G, p",
        [ "Blocks", "Operations" ],
        rec( group := "BrauerCharacterDegreesOfBlocks" )
        );

DeclareOperationWithDocumentation( "CartanMatricesOfBlocks",
        [ IsCharacterTable, IsInt ],
        [ "Computes the list of Cartan matrices of the <A>p</A>-blocks of the group <A>G</A>",
          "or the underlying ordinary character table <A>tbl</A>." ],
        "a list",
        "tbl, p",
        [ "Blocks", "Operations" ],
        rec( group := "CartanMatricesOfBlocks" )
        );

DeclareOperationWithDocumentation( "CartanMatricesOfBlocks",
        [ IsGroup, IsInt ],
        "<#Include Label=\"CartanMatricesOfBlocks\">",
        "a list",
        "G, p",
        [ "Blocks", "Operations" ],
        rec( group := "CartanMatricesOfBlocks" )
        );
