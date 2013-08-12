#############################################################################
##
##  UnitaryGroup.gd                                           Blocks package
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

DeclareOperation( "UnitaryGroup",
        [ IsHomalgModule ] );

DeclareOperation( "UnitaryGroup",
        [ IsRing, IsAlgebra ] );

DeclareOperation( "UnitaryGroupModuloIdeal",
        [ IsHomalgFiltration ] );

DeclareOperation( "UnitaryGroup",
        [ IsRing, IsAlgebra, IsAlgebra ] );

DeclareOperation( "SemiSimplePartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

DeclareOperation( "CotangentPartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

DeclareOperation( "IsCotangentPartUnionOfAffineSpaces",
        [ IsRing, IsAlgebra ] );

DeclareOperation( "RadicalPartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

DeclareOperation( "LowerPartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

DeclareOperation( "IsLowerPartExtensionOfAffineSpaces",
        [ IsRing, IsAlgebra ] );
