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

DeclareAttribute( "DefiningIdealOfUnitaryGroup",
        IsHomalgModule );


####################################
#
# global functions and operations:
#
####################################

# basic operations:

DeclareOperation( "NormalizedUnitaryGroup",
        [ IsRing ] );

DeclareOperation( "NormalizedUnitaryGroup",
        [ IsField, IsGroup ] );

DeclareOperation( "DefiningIdealOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

DeclareOperation( "SizeOfUnitaryGroupOfGroupRing",
        [ IsRing, IsGroup ] );

DeclareOperation( "NaiveSizeOfUnitaryGroupOfGroupRing",
        [ IsRing, IsGroup ] );

DeclareOperation( "DefiningIdealOfUnitaryGroupModuloIdeal",
        [ IsHomalgFiltration ] );

DeclareOperation( "DefiningIdealOfUnitaryGroup",
        [ IsRing, IsList ] );

DeclareOperation( "DefiningIdealOfUnitaryGroup",
        [ IsRing, IsRecord ] );

DeclareOperation( "DefiningIdealOfUnitaryGroup",
        [ IsRing, IsAlgebra, IsAlgebra ] );

DeclareOperation( "DefiningIdealOfSemiSimplePartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

DeclareOperation( "DefiningIdealOfCotangentPartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

DeclareOperation( "IsCotangentPartUnionOfAffineSpaces",
        [ IsRing, IsAlgebra ] );

DeclareOperation( "DefiningIdealOfRadicalPartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

DeclareOperation( "DefiningIdealOfLowerPartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

DeclareOperation( "IsLowerPartExtensionOfAffineSpaces",
        [ IsRing, IsAlgebra ] );
