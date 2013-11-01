#############################################################################
##
##  Tools.gd                                                  Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Declaration stuff for tools.
##
#############################################################################

#! @Chapter Tools

####################################
#
# @Section Attributes
#
####################################


####################################
#
#! @Section Operations
#
####################################

#! @Description
#!  Computes the field of the list <A>e</A> of group ring elements.
#! @Arguments e
#! @Returns a field
DeclareOperation( "FieldOfGroupRingElements",
        [ IsList ] );
#! @InsertSystem FieldOfGroupRingElements

#!
DeclareOperation( "Coerce",
        [ IsRingElement, IsElementOfFreeMagmaRing ] );

#!
DeclareOperation( "Coefficients",
        [ IsHomalgModule, IsElementOfFreeMagmaRing ] );

#!
DeclareOperation( "Coefficients",
        [ IsHomalgFiltration, IsElementOfFreeMagmaRing ] );
