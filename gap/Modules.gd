#############################################################################
##
##  Modules.gd                                                Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Declaration stuff for modules.
##
#############################################################################

####################################
#
# attributes:
#
####################################

DeclareAttribute( "GeneralElementsOfFiltration",
        IsHomalgFiltration );

DeclareAttribute( "AsElementOfAlgebra",
        IsHomalgModuleElement );

DeclareAttribute( "Antipode",
        IsHomalgModule );

####################################
#
# global functions and operations:
#
####################################

# basic operations:

DeclareOperation( "GeneralElement",
        [ IsHomalgModule ] );

DeclareOperation( "GradedPartsOfFilteredMorphism",
        [ IsHomalgMorphism, IsHomalgFiltration ] );

DeclareOperation( "ExtractDefiningIdeal",
        [ IsHomalgModuleElement ] );
