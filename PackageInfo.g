SetPackageInfo( rec(

PackageName := "Blocks",

Subtitle := "Tools for block theory",

Version := Maximum( [
                   "2020.01.01", ## Mohamed's version
                   ## this line prevents merge conflicts
                   ] ),

# this avoids git-merge conflicts
Date := ~.Version{[ 1 .. 10 ]},
Date := Concatenation( ~.Date{[ 9, 10 ]}, "/", ~.Date{[ 6, 7 ]}, "/", ~.Date{[ 1 .. 4 ]} ),

ArchiveURL := Concatenation( "http://homalg.math.rwth-aachen.de/~barakat/homalg-project/Blocks-", ~.Version ),

ArchiveFormats := ".tar.gz",

Persons := [
  rec( 
    LastName      := "Barakat",
    FirstNames    := "Mohamed",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "mohamed.barakat@rwth-aachen.de",
    WWWHome       := "http://www.mathematik.uni-kl.de/~barakat/",
    PostalAddress := Concatenation( [
                       "Lehrstuhl B fuer Mathematik, RWTH Aachen\n",
                       "Templergraben 64\n",
                       "52062 Aachen\n",
                       "Germany" ] ),
    Place         := "Aachen",
    Institution   := "RWTH Aachen University"
  ),
  
],

Status := "dev",

README_URL := 
  "http://homalg.math.rwth-aachen.de/~barakat/homalg-project/Blocks/README.Blocks",
PackageInfoURL := 
  "http://homalg.math.rwth-aachen.de/~barakat/homalg-project/Blocks/PackageInfo.g",

PackageDoc := rec(
  BookName  := "Blocks",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Tools for block theory",
),

Dependencies := rec(
  GAP := ">=4.4",
  NeededOtherPackages := [
                   [ "AutoDoc", ">= 2013.12.04" ],
                   [ "homalg", ">= 2013.09.03" ],
                   [ "Modules", ">= 2015.01.13" ],
                   [ "RingsForHomalg", ">= 2013.08.22" ],
                   [ "GaussForHomalg", ">= 2013.06.26" ],
                   [ "MatricesForHomalg", ">= 2013.10.27" ],
                   [ "ctblocks", ">= 0.9.1" ],
                   [ "LAGUNA", ">= 3.6.3" ],
                   [ "GAPDoc", ">= 1.1" ]
                   ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ]
),

AvailabilityTest := ReturnTrue,

Keywords := [ "block", "defect group" ]

));
