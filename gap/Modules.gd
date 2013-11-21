#############################################################################
##
##  Modules.gd                                                Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Declaration stuff for modules.
##
#############################################################################

#! @Chapter Tools

####################################
#
#! @Section Attributes
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
#! @Section Operations
#
####################################

#!
DeclareOperation( "GeneralElement",
        [ IsHomalgModule ] );

#!
DeclareOperation( "GradedPartsOfFilteredMorphism",
        [ IsHomalgMorphism, IsHomalgFiltration ] );

#!
DeclareOperation( "ExtractDefiningIdeal",
        [ IsHomalgModuleElement ] );
