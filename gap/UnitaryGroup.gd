#############################################################################
##
##  UnitaryGroup.gd                                           Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Declaration stuff for unitary groups.
##
#############################################################################

#! @Chapter Unitary groups

####################################
#
#! @Section Properties
#
####################################

#! @Description
#!  Check if the <Q>middle part</Q> of the unitary group of the involutive algebra <A>A</A>
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
#! @InsertChunk NumberOfQuadraticEquationsOfUnitaryGroup

#! @Description
#!  Computes the dimension of the unitary group
#!  of the group ring <A>kG</A> of a group <M>G</M>.
#! @Arguments kG
#! @Returns a nonnegative integer
#! @Label for IsGroupAlgebra
DeclareAttribute( "DimensionOfUnitaryGroup",
        IsGroupAlgebra );
#! @InsertChunk DimensionOfUnitaryGroup

#! @Arguments filt
#! @Returns an ideal
DeclareAttribute( "DefiningIdealOfUnitaryGroupOfHead",
        IsHomalgFiltration );

#! @Description
#!  Computes the defining ideal of the unitary group of the semi-simple factor <A>A</A><M>/\mathfrak{r}</M>
#!  of the involutive algebra <A>A</A> modulo its radical <M>\mathfrak{r}</M>.
#! @Arguments A
#! @Returns an ideal
#! @Label for IsAlgebra
#! @Group DefiningIdealOfUnitaryGroupOfSemiSimpleFactor
DeclareAttribute( "DefiningIdealOfUnitaryGroupOfSemiSimpleFactor",
        IsAlgebra );

#! @Description
#!  Computes the defining ideal of the <Q>upper part</Q> of the unitary group of the involutive algebra <A>A</A>
#!  as the kernel of <M>\varphi_{A / \mathfrak{r}} :=</M> <C>DefiningIdealOfUpperPartOfUnitaryGroup</C>( <A>A</A> ),
#!  where <M>\mathfrak{r}</M> denotes the radical of <A>A</A>.
#! @Arguments A
#! @Returns an ideal
#! @Label for IsAlgebra
#! @Group DefiningIdealOfUpperPartOfUnitaryGroup
DeclareAttribute( "DefiningIdealOfUpperPartOfUnitaryGroup",
        IsAlgebra );

#! @Arguments A
#! @Group DefiningIdealOfUpperPartOfUnitaryGroup
DeclareAttribute( "DefiningMorphismOfUpperPartOfUnitaryGroup",
        IsAlgebra );

#! @Description
#!  Computes the defining ideal of the <Q>middle part</Q> of the unitary group of the involutive algebra <A>A</A>
#!  as the kernel of <M>\varphi_{\mathfrak{r} / \mathfrak{r}^2} :=</M> <C>DefiningIdealOfMiddlePartOfUnitaryGroup</C>( <A>A</A> ),
#!  where <M>\mathfrak{r}</M> denotes the radical of <A>A</A>.
#! @Arguments A
#! @Returns an ideal
#! @Label for IsAlgebra
#! @Group DefiningIdealOfMiddlePartOfUnitaryGroup
DeclareAttribute( "DefiningIdealOfMiddlePartOfUnitaryGroup",
        IsAlgebra );

#! @Arguments A
#! @Group DefiningIdealOfMiddlePartOfUnitaryGroup
DeclareAttribute( "DefiningMorphismOfMiddlePartOfUnitaryGroup",
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
#!  Computes the defining ideal of the <Q>higher part</Q> of the unitary group of the involutive algebra <A>A</A>
#!  as the kernel of <M>\varphi_{A / \mathfrak{r}^2} :=</M> <C>DefiningIdealOfHigherPartOfUnitaryGroup</C>( <A>A</A> ),
#!  where <M>\mathfrak{r}</M> denotes the radical of <A>A</A>.
#! @Arguments A
#! @Returns an ideal
#! @Label for IsAlgebra
#! @Group DefiningIdealOfHigherPartOfUnitaryGroup
DeclareAttribute( "DefiningIdealOfHigherPartOfUnitaryGroup",
        IsAlgebra );

#! @Arguments A
#! @Group DefiningIdealOfHigherPartOfUnitaryGroup
DeclareAttribute( "DefiningMorphismOfHigherPartOfUnitaryGroup",
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

#! @Arguments kG
#! @Returns a group
#! @Group NormalizedUnitaryGroup
DeclareOperation( "NormalizedUnitaryGroup",
        [ IsGroupRing ] );

#! @Arguments k, G
#! @Group NormalizedUnitaryGroup
DeclareOperation( "NormalizedUnitaryGroup",
        [ IsField, IsGroup ] );

#! @Description
#!  Computes the defining ideal of the unitary group of the involutive algebra <A>A</A>
#!  (with or without one, in the latter case it has to be a two-sided ideal in an involutive algebra with one)
#!  with <C>CoefficientsRingForPolynomialAlgebra</C>( <A>A</A> ) set to <A>k</A> and
#!  <A>M</A> := <C>UnderlyingModule</C>( <A>k</A>, <A>A</A> ),
#!  the underlying &homalg; module <A>M</A> (over the polynomial <A>k</A>-algebra
#!  in as many indeterminates as <M>\dim</M><A>A</A> and which still knows about <A>A</A>).
#!  In the other cases it computes the relative unitary group
#!  of <A>A</A> relative to a involution-stable two-side ideal <A>J</A>
#!  (caution: the latter is in characteristic <M>2</M> generally <E>not</E> the unitary group of <A>A</A><M>/</M><A>J</A>).
#!  If one specifies a chain of stable ideals as a list <A>L</A>,
#!  or a filtration <A>filt</A> (with <A>M</A> = <C>UnderlyingObject</C>( <A>filt</A> )),
#!  or a record <A>r</A> with successive nonnegative integers, then <A>A</A>
#!  is set to the first entry and <A>J</A> to the second and the basis of <A>A</A> and <A>J</A> is adapted to the whole chain,
#!  which occasionally provides a big computational advantage.
#!  The defining ideal in the relative case is computed as the kernel of the ring morphism
#!  <M>\varphi_{A/J} :=</M> <C>DefiningMorphismOfUnitaryGroup</C>( <A>filt</A> ).
#! @Arguments A
#! @Returns an ideal
#! @Label for IsAlgebra
#! @Group DefiningIdealOfUnitaryGroup
DeclareOperation( "DefiningIdealOfUnitaryGroup",
        [ IsAlgebra ] );

#! @Arguments M
#! @Group DefiningIdealOfUnitaryGroup
DeclareOperation( "DefiningIdealOfUnitaryGroup",
        [ IsHomalgModule ] );

#! @Arguments filt
#! @Group DefiningIdealOfUnitaryGroup
DeclareOperation( "DefiningMorphismOfUnitaryGroup",
        [ IsHomalgFiltration ] );

#! @Arguments filt
#! @Group DefiningIdealOfUnitaryGroup
DeclareOperation( "DefiningIdealOfUnitaryGroup",
        [ IsHomalgFiltration ] );

#! @Arguments k, A
#! @Group DefiningIdealOfUnitaryGroup
DeclareOperation( "DefiningIdealOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

#! @Arguments k, G
#! @Returns a positive integer
DeclareOperation( "SizeOfUnitaryGroupOfGroupRing",
        [ IsRing, IsGroup ] );

#! @Arguments k, G
#! @Returns a positive integer
DeclareOperation( "ExpectedSizeOfUnitaryGroupOfGroupRingOf2Group",
        [ IsRing, IsGroup ] );

#! @Arguments k, L
#! @Group DefiningIdealOfUnitaryGroup
DeclareOperation( "DefiningIdealOfUnitaryGroup",
        [ IsRing, IsList ] );

#! @Arguments k, r
#! @Group DefiningIdealOfUnitaryGroup
DeclareOperation( "DefiningIdealOfUnitaryGroup",
        [ IsRing, IsRecord ] );

#! @Arguments k, A, J
#! @Group DefiningIdealOfUnitaryGroup
DeclareOperation( "DefiningIdealOfUnitaryGroup",
        [ IsRing, IsAlgebra, IsAlgebra ] );

#! @Arguments k, A
#! @Group DefiningIdealOfUnitaryGroupOfSemiSimpleFactor
DeclareOperation( "DefiningIdealOfUnitaryGroupOfSemiSimpleFactor",
        [ IsRing, IsAlgebra ] );

#! @Arguments k, A
#! @Group DefiningIdealOfUpperPartOfUnitaryGroup
DeclareOperation( "DefiningIdealOfUpperPartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

#! @Arguments k, A
#! @Group DefiningIdealOfUpperPartOfUnitaryGroup
DeclareOperation( "DefiningMorphismOfUpperPartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

#! @Arguments k, A
#! @Group DefiningIdealOfMiddlePartOfUnitaryGroup
DeclareOperation( "DefiningIdealOfMiddlePartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

#! @Arguments k, A
#! @Group DefiningIdealOfMiddlePartOfUnitaryGroup
DeclareOperation( "DefiningMorphismOfMiddlePartOfUnitaryGroup",
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
#! @Group DefiningIdealOfHigherPartOfUnitaryGroup
DeclareOperation( "DefiningIdealOfHigherPartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

#! @Arguments k, A
#! @Group DefiningIdealOfHigherPartOfUnitaryGroup
DeclareOperation( "DefiningMorphismOfHigherPartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

#! @Arguments k, A
#! @Group DefiningIdealOfLowerPartOfUnitaryGroup
DeclareOperation( "DefiningIdealOfLowerPartOfUnitaryGroup",
        [ IsRing, IsAlgebra ] );

#! @Arguments k, A
#! @Group IsLowerPartExtensionOfAffineSpaces
DeclareOperation( "IsLowerPartExtensionOfAffineSpaces",
        [ IsRing, IsAlgebra ] );
