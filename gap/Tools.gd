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
#! @InsertChunk FieldOfGroupRingElements

#! @Arguments o, r
DeclareOperation( "Coerce",
        [ IsRingElement, IsMultiplicativeElement ] );

#! @Arguments M, c
DeclareOperation( "Coefficients",
        [ IsHomalgModule, IsElementOfFreeMagmaRing ] );

#! @Arguments filt, c
DeclareOperation( "Coefficients",
        [ IsHomalgFiltration, IsElementOfFreeMagmaRing ] );
