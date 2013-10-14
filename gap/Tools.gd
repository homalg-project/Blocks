#############################################################################
##
##  Tools.gd                                                  Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Declaration stuff for tools.
##
#############################################################################

####################################
#
# attributes:
#
####################################


####################################
#
# global functions and operations:
#
####################################

# basic operations:

DeclareOperationWithDocumentation( "FieldOfGroupRingElements",
        [ IsList ],
        [ "Computes the field of the list <A>e</A> of group ring elements.",
          "<#Include Label=\"FieldOfGroupRingElements\">" ],
        "a field",
        "e",
        [ "Tools", "Operations" ]
        );

DeclareOperation( "Coerce",
        [ IsRingElement, IsElementOfFreeMagmaRing ] );

DeclareOperation( "Coefficients",
        [ IsHomalgModule, IsElementOfFreeMagmaRing ] );

DeclareOperation( "Coefficients",
        [ IsHomalgFiltration, IsElementOfFreeMagmaRing ] );
