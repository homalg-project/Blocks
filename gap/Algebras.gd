#############################################################################
##
##  Algebras.gd                                               Blocks package
##
##  Copyright 2013,      Mohamed Barakat, University of Kaiserslautern
##
##  Declaration stuff for algebras.
##
#############################################################################

####################################
#
# attributes:
#
####################################

DeclareAttributeWithDocumentation( "RadicalOfAlgebraPowers",
        IsAlgebra,
        [ "Computes the list of powers <M>rad^i</M> of the radical <M>rad</M> of <A>A</A>,",
          "starting with the algebra <A>A</A>, regarded as the <M>0</M>-th power.",
          "<#Include Label=\"RadicalOfAlgebraPowers\">" ],
        "a record",
        "A",
        [ "Algebras", "Attributes" ],
        rec( function_label := "for IsAlgebra" )
        );

DeclareAttributeWithDocumentation( "RadicalOfAlgebraPowersAsIntersection",
        IsAlgebra,
        [ "Computes the list of powers <M>rad^i</M> of the radical <M>rad</M> of the subalgebra <A>A</A>",
          "of some algebra <M>B</M> as the intersection of the powers of radical of <M>B</M> with <A>A</A>",
          "(&see; <Ref Attr=\"RadicalOfAlgebraPowers\" Label=\"for IsAlgebra\"/>)." ],
        "a record",
        "A",
        [ "Algebras", "Attributes" ],
        rec( function_label := "for IsAlgebra" )
        );

DeclareAttributeWithDocumentation( "AugmentationIdealPowers",
        IsAlgebraWithOne,
        [ "Computes the list of powers <M>I^i</M> of the augmentation ideal <M>I</M> of the group algebra <A>kG</A>",
          "starting with the algebra <A>A</A>, regarded as the <M>0</M>-th power.",
          "<#Include Label=\"AugmentationIdealPowers\">" ],
        "a record",
        "kG",
        [ "Algebras", "Attributes" ],
        rec( function_label := "for IsAlgebraWithOne" )
        );

DeclareAttributeWithDocumentation( "HighestPowerOfAugmentationIdeal",
        IsAlgebraWithOne,
        [ "Computes <M>I^i</M> such that <M>I^{{i+1}} = I^i</M>",
          "where <M>I</M> is the augmentation ideal of the group algebra <A>kG</A>",
          "(&see; <Ref Attr=\"AugmentationIdealPowers\" Label=\"for IsAlgebraWithOne\"/>).",
          "<#Include Label=\"HighestPowerOfAugmentationIdeal\">" ],
        "a two-sided ideal",
        "kG",
        [ "Algebras", "Attributes" ],
        rec( function_label := "for IsAlgebraWithOne" )
        );

DeclareAttributeWithDocumentation( "CentralIdempotentsOfInvolutiveAlgebra",
        IsAlgebraWithOne,
        [ "Computes the list of central primitive idempotents of the <E>involutive</E> algebra <A>A</A>.",
          "<#Include Label=\"CentralIdempotentsOfInvolutiveAlgebra\">" ],
        "a list",
        "A",
        [ "Algebras", "Attributes" ],
        rec( function_label := "for IsAlgebraWithOne" )
        );

####################################
#
# global functions and operations:
#
####################################

# basic operations:

DeclareOperation( "UnderlyingGroupAlgebra",
        [ IsAlgebra ] );

DeclareOperation( "UnderlyingGroupAlgebra",
        [ IsElementOfFreeMagmaRing ] );

DeclareOperation( "UnderlyingBrauerTable",
        [ IsElementOfFreeMagmaRing ] );

DeclareOperation( "UnderlyingModule",
        [ IsRing, IsAlgebra ] );

DeclareOperation( "InducedFiltration",
        [ IsRing, IsList ] );

DeclareOperation( "InducedFiltration",
        [ IsRing, IsRecord ] );
