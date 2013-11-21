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

#! @Arguments filt
DeclareAttribute( "GeneralElementsOfFiltration",
        IsHomalgFiltration );

#! @Arguments m
DeclareAttribute( "AsElementOfAlgebra",
        IsHomalgModuleElement );

#! @Arguments M
DeclareAttribute( "Antipode",
        IsHomalgModule );

####################################
#
#! @Section Operations
#
####################################

#! @Arguments M
DeclareOperation( "GeneralElement",
        [ IsHomalgModule ] );

#! @Arguments phi, filt
DeclareOperation( "GradedPartsOfFilteredMorphism",
        [ IsHomalgMorphism, IsHomalgFiltration ] );

#! @Arguments m
DeclareOperation( "ExtractDefiningIdeal",
        [ IsHomalgModuleElement ] );
