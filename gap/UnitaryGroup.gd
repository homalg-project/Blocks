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

DeclarePropertyWithDocumentation( "IsMiddlePartUnionOfAffineSpaces",
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

DeclareAttributeWithDocumentation( "DefiningIdealOfUnitaryGroup",
        IsAlgebra,
        "The defining ideal of the unitary group of the involutive algebra <A>A</A>.",
        "an ideal",
        "A",
        [ "Unitary groups", "Attributes" ],
        rec( function_label := "for IsAlgebra" )
        );

DeclareAttribute( "DefiningIdealOfUnitaryGroup",
        IsHomalgModule );

DeclareAttributeWithDocumentation( "DefiningIdealOfUpperPartOfUnitaryGroup",
        IsAlgebra,
        "The defining ideal of the <Q>semisimple part</Q> of the unitary group of the involutive algebra <A>A</A>.",
        "an ideal",
        "A",
        [ "Unitary groups", "Attributes" ],
        rec( function_label := "for IsAlgebra" )
        );

DeclareAttributeWithDocumentation( "DefiningIdealOfMiddlePartOfUnitaryGroup",
        IsAlgebra,
        "The defining ideal of the <Q>cotangent part</Q> of the unitary group of the involutive algebra <A>A</A>.",
        "an ideal",
        "A",
        [ "Unitary groups", "Attributes" ],
        rec( function_label := "for IsAlgebra" )
        );

DeclareAttributeWithDocumentation( "DefiningIdealOfRadicalPartOfUnitaryGroup",
        IsAlgebra,
        "The defining ideal of the <Q>radical part</Q> of the unitary group of the involutive algebra <A>A</A>.",
        "an ideal",
        "A",
        [ "Unitary groups", "Attributes" ],
        rec( function_label := "for IsAlgebra" )
        );

DeclareAttributeWithDocumentation( "DefiningIdealOfLowerPartOfUnitaryGroup",
        IsAlgebra,
        "The defining ideal of the <Q>lower part</Q> of the unitary group of the involutive algebra <A>A</A>.",
        "an ideal",
        "A",
        [ "Unitary groups", "Attributes" ],
        rec( function_label := "for IsAlgebra" )
        );

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

DeclareOperation( "DefiningIdealOfUpperPartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

DeclareOperation( "DefiningIdealOfMiddlePartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

DeclareOperation( "IsMiddlePartUnionOfAffineSpaces",
        [ IsRing, IsAlgebra ] );

DeclareOperation( "DefiningIdealOfRadicalPartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

DeclareOperation( "DefiningIdealOfLowerPartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

DeclareOperation( "IsLowerPartExtensionOfAffineSpaces",
        [ IsRing, IsAlgebra ] );
