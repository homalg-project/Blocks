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
# properties:
#
####################################

DeclarePropertyWithDocumentation( "IsCotangentPartUnionOfAffineSpaces",
        IsAlgebra,
        [ "Check if the <Q>cotangent part</Q> of the unitary group of the involutive algebra <A>A</A>",
          "is a union of affine spaces." ],
        "A",
        [ "Unitary groups", "Properties" ],
        rec( function_label := "for IsAlgebra" )
        );

DeclarePropertyWithDocumentation( "IsLowerPartExtensionOfAffineSpaces",
        IsAlgebra,
        [ "Check if the <Q>lower part</Q> of the unitary group of the involutive algebra <A>A</A>",
          "is a extension of affine spaces." ],
        "A",
        [ "Unitary groups", "Properties" ],
        rec( function_label := "for IsAlgebra" )
        );

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
