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
#! @Group IsMiddlePartUnionOfAffineSpaces
DeclareProperty( "IsMiddlePartUnionOfAffineSpaces",
        IsAlgebra );

#! @Description
#!  Check if the <Q>lower part</Q> of the unitary group of the involutive algebra <A>A</A>
#!  is a extension of affine spaces.
#! @Arguments A
#! @Label for IsAlgebra
#! @Group IsLowerPartExtensionOfAffineSpaces
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
#!  Computes the defining ideal of the unitary group of the involutive algebra <A>A</A>
#!  (with or without one, in the latter case it has to be a two-sided ideal in an involutive algebra with one)
#!  with <C>CoefficientsRingForPolynomialAlgebra</C>( <A>A</A> ) set to <A>k</A> and
#!  <A>M</A> := <C>UnderlyingModule</C>( <A>k</A>, <A>A</A> ),
#!  the underlying &homalg; module <A>M</A> (over the polynomial <A>k</A>-algebra
#!  in as many indeterminates as <M>\dim</M><A>A</A> and which still knows about <A>A</A>).
#!  In the other cases it computes the relative unitary group
#!  of <A>A</A> relative to a involution-stable two-side ideal <A>I</A>
#!  (caution: the latter is in characteristic <M>2</M> generally <E>not</E> the unitary group of <A>A</A><M>/</M><A>I</A>).
#!  If one specifies a chain of stable ideals as a list <A>L</A>,
#!  or a filtration <A>filt</A> (with <A>M</A> = <C>UnderlyingObject</C>( <A>filt</A> )),
#!  or a record <A>r</A> with successive nonnegative integers, then <A>A</A>
#!  is set to the first entry and <A>I</A> to the second and the basis of <A>A</A> and <A>I</A> is adapted to the whole chain,
#!  which occasionally provides a big computational advantage.
#! @Arguments A
#! @Returns an ideal
#! @Label for IsAlgebra
#! @Group DefiningIdealOfUnitaryGroup
DeclareAttribute( "DefiningIdealOfUnitaryGroup",
        IsAlgebra );

#! @Arguments M
#! @Group DefiningIdealOfUnitaryGroup
DeclareAttribute( "DefiningIdealOfUnitaryGroup",
        IsHomalgModule );

#! @Description
#!  Computes the defining ideal of the <Q>upper part</Q> of the unitary group of the involutive algebra <A>A</A>.
#! @Arguments A
#! @Returns an ideal
#! @Label for IsAlgebra
#! @Group DefiningIdealOfUpperPartOfUnitaryGroup
DeclareAttribute( "DefiningIdealOfUpperPartOfUnitaryGroup",
        IsAlgebra );

#! @Description
#!  Computes the defining ideal of the <Q>middle part</Q> of the unitary group of the involutive algebra <A>A</A>.
#! @Arguments A
#! @Returns an ideal
#! @Label for IsAlgebra
#! @Group DefiningIdealOfMiddlePartOfUnitaryGroup
DeclareAttribute( "DefiningIdealOfMiddlePartOfUnitaryGroup",
        IsAlgebra );

#! @Description
#!  Computes the defining ideal of the <Q>middle part</Q> of the unitary group of the involutive algebra <A>A</A>
#!  using a basis adapted to the complete chain of radical powers of <A>A</A>.
#! @Arguments A
#! @Returns an ideal
#! @Label for IsAlgebra
#! @Group DefiningIdealOfMiddlePartOfUnitaryGroupUsingAdaptedBasis
DeclareAttribute( "DefiningIdealOfMiddlePartOfUnitaryGroupUsingAdaptedBasis",
        IsAlgebra );

#! @Description
#!  Computes the defining ideal of the <Q>radical part</Q> of the unitary group of the involutive algebra <A>A</A>.
#! @Arguments A
#! @Returns an ideal
#! @Label for IsAlgebra
#! @Group DefiningIdealOfRadicalPartOfUnitaryGroup
DeclareAttribute( "DefiningIdealOfRadicalPartOfUnitaryGroup",
        IsAlgebra );

#! @Description
#!  Computes the defining ideal of the <Q>lower part</Q> of the unitary group of the involutive algebra <A>A</A>.
#! @Arguments A
#! @Returns an ideal
#! @Label for IsAlgebra
#! @Group DefiningIdealOfLowerPartOfUnitaryGroup
DeclareAttribute( "DefiningIdealOfLowerPartOfUnitaryGroup",
        IsAlgebra );

####################################
#
#! @Section Operations
#
####################################

#! @Group NormalizedUnitaryGroup
DeclareOperation( "NormalizedUnitaryGroup",
        [ IsRing ] );

#! @Group NormalizedUnitaryGroup
DeclareOperation( "NormalizedUnitaryGroup",
        [ IsField, IsGroup ] );

#! @Arguments k, A
#! @Group DefiningIdealOfUnitaryGroup
DeclareOperation( "DefiningIdealOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

#!
DeclareOperation( "SizeOfUnitaryGroupOfGroupRing",
        [ IsRing, IsGroup ] );

#!
DeclareOperation( "NaiveSizeOfUnitaryGroupOfGroupRing",
        [ IsRing, IsGroup ] );

#! @Arguments filt
#! @Group DefiningIdealOfUnitaryGroup
DeclareOperation( "DefiningIdealOfUnitary",
        [ IsHomalgFiltration ] );

#! @Arguments k, L
#! @Group DefiningIdealOfUnitaryGroup
DeclareOperation( "DefiningIdealOfUnitaryGroup",
        [ IsRing, IsList ] );

#! @Arguments k, r
#! @Group DefiningIdealOfUnitaryGroup
DeclareOperation( "DefiningIdealOfUnitaryGroup",
        [ IsRing, IsRecord ] );

#! @Arguments k, A, I
#! @Group DefiningIdealOfUnitaryGroup
DeclareOperation( "DefiningIdealOfUnitaryGroup",
        [ IsRing, IsAlgebra, IsAlgebra ] );

#! @Arguments k, A
#! @Group DefiningIdealOfUpperPartOfUnitaryGroup
DeclareOperation( "DefiningIdealOfUpperPartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

#! @Arguments k, A
#! @Group DefiningIdealOfMiddlePartOfUnitaryGroup
DeclareOperation( "DefiningIdealOfMiddlePartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

#! @Arguments k, A
#! @Group DefiningIdealOfMiddlePartOfUnitaryGroupUsingAdaptedBasis
DeclareOperation( "DefiningIdealOfMiddlePartOfUnitaryGroupUsingAdaptedBasis",
        [ IsRing, IsAlgebra ] );

#! @Arguments k, A
#! @Group IsMiddlePartUnionOfAffineSpaces
DeclareOperation( "IsMiddlePartUnionOfAffineSpaces",
        [ IsRing, IsAlgebra ] );

#! @Arguments k, A
#! @Group DefiningIdealOfRadicalPartOfUnitaryGroup
DeclareOperation( "DefiningIdealOfRadicalPartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

#! @Arguments k, A
#! @Group DefiningIdealOfLowerPartOfUnitaryGroup
DeclareOperation( "DefiningIdealOfLowerPartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

#! @Arguments k, A
#! @Group IsLowerPartExtensionOfAffineSpaces
DeclareOperation( "IsLowerPartExtensionOfAffineSpaces",
        [ IsRing, IsAlgebra ] );
