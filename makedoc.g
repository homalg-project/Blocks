LoadPackage( "AutoDoc" );

AutoDoc( "Blocks" :
        
        scaffold := rec( entities := [ "homalg", "GAP4" ],
                         ),
        
        autodoc := true,
        
        maketest := rec( folder := ".",
                         commands :=
                         [ "LoadPackage( \"Blocks\" );",
                           "LoadPackage( \"IO_ForHomalg\" );",
                           "HOMALG_IO.show_banners := false;",
                           "HOMALG_IO.suppress_PID := true;",
                           "HOMALG_IO.use_common_stream := true;",
                           "HOMALG.SuppressParityInViewObjForCommutativeStructureObjects := true;",
                           ],
                         ),
        
        Bibliography := "Blocks.bib"
        
);

# Create VERSION file for "make towww"
PrintTo( "VERSION", PackageInfo( "Blocks" )[1].Version );

QUIT;
