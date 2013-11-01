#############################################################################
##
##  UnitaryGroup.gd                                           Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Declaration stuff for tools.
##
#############################################################################

#! @Chapter Unitary groups

####################################
#
#! @Section Properties
#
####################################

#! @Description
#!  Check if the <Q>cotangent part</Q> of the unitary group of the involutive algebra <A>A</A>
#!  is a union of affine spaces.
#! @Arguments A
#! @Label for IsAlgebra
DeclareProperty( "IsMiddlePartUnionOfAffineSpaces",
        IsAlgebra );

#! @Description
#!  Check if the <Q>lower part</Q> of the unitary group of the involutive algebra <A>A</A>
#!  is a extension of affine spaces.
#! @Arguments A
#! @Label for IsAlgebra
DeclareProperty( "IsLowerPartExtensionOfAffineSpaces",
        IsAlgebra );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  Computes the number of quadratic equations
#!  defining the unitary group of the group ring of <A>kG</A>
#!  of a group <M>G</M>.
#! @Arguments kG
#! @Returns a nonnegative integer
#! @Label for IsGroupAlgebra
DeclareAttribute( "NumberOfQuadraticEquationsOfUnitaryGroup",
        IsGroupAlgebra );
#! @InsertSystem NumberOfQuadraticEquationsOfUnitaryGroup

#! @Description
#!  Computes the dimension of the unitary group
#!  of the group ring <A>kG</A> of a group <M>G</M>.
#! @Arguments kG
#! @Returns a nonnegative integer
#! @Label for IsGroupAlgebra
DeclareAttribute( "DimensionOfUnitaryGroup",
        IsGroupAlgebra );
#! @InsertSystem DimensionOfUnitaryGroup

#! @Description
#!  Computes the defining ideal of the unitary group of the involutive algebra <A>A</A>.
#! @Arguments A
#! @Returns an ideal
#! @Label for IsAlgebra
DeclareAttribute( "DefiningIdealOfUnitaryGroup",
        IsAlgebra );

DeclareAttribute( "DefiningIdealOfUnitaryGroup",
        IsHomalgModule );

#! @Description
#!  Computes the defining ideal of the <Q>upper part</Q> of the unitary group of the involutive algebra <A>A</A>.
#! @Arguments A
#! @Returns an ideal
#! @Label for IsAlgebra
DeclareAttribute( "DefiningIdealOfUpperPartOfUnitaryGroup",
        IsAlgebra );

#! @Description
#!  Computes the defining ideal of the <Q>middle part</Q> of the unitary group of the involutive algebra <A>A</A>.
#! @Arguments A
#! @Returns an ideal
#! @Label for IsAlgebra
DeclareAttribute( "DefiningIdealOfMiddlePartOfUnitaryGroup",
        IsAlgebra );

#! @Description
#!  Computes the defining ideal of the <Q>radical part</Q> of the unitary group of the involutive algebra <A>A</A>.
#! @Arguments A
#! @Returns an ideal
#! @Label for IsAlgebra
DeclareAttribute( "DefiningIdealOfRadicalPartOfUnitaryGroup",
        IsAlgebra );

#! @Description
#!  Computes the defining ideal of the <Q>lower part</Q> of the unitary group of the involutive algebra <A>A</A>.
#! @Arguments A
#! @Returns an ideal
#! @Label for IsAlgebra
DeclareAttribute( "DefiningIdealOfLowerPartOfUnitaryGroup",
        IsAlgebra );

####################################
#
#! @Section Operations
#
####################################

#!
DeclareOperation( "NormalizedUnitaryGroup",
        [ IsRing ] );

#!
DeclareOperation( "NormalizedUnitaryGroup",
        [ IsField, IsGroup ] );

#!
DeclareOperation( "DefiningIdealOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

#!
DeclareOperation( "SizeOfUnitaryGroupOfGroupRing",
        [ IsRing, IsGroup ] );

#!
DeclareOperation( "NaiveSizeOfUnitaryGroupOfGroupRing",
        [ IsRing, IsGroup ] );

#!
DeclareOperation( "DefiningIdealOfUnitaryGroupModuloIdeal",
        [ IsHomalgFiltration ] );

#!
DeclareOperation( "DefiningIdealOfUnitaryGroup",
        [ IsRing, IsList ] );

#!
DeclareOperation( "DefiningIdealOfUnitaryGroup",
        [ IsRing, IsRecord ] );

#!
DeclareOperation( "DefiningIdealOfUnitaryGroup",
        [ IsRing, IsAlgebra, IsAlgebra ] );

#!
DeclareOperation( "DefiningIdealOfUpperPartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

#!
DeclareOperation( "DefiningIdealOfMiddlePartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

#!
DeclareOperation( "IsMiddlePartUnionOfAffineSpaces",
        [ IsRing, IsAlgebra ] );

#!
DeclareOperation( "DefiningIdealOfRadicalPartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

#!
DeclareOperation( "DefiningIdealOfLowerPartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

#!
DeclareOperation( "IsLowerPartExtensionOfAffineSpaces",
        [ IsRing, IsAlgebra ] );
