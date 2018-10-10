

source create_paths_for_libraries.sh

generate_paths()
{
	local root_path="$1"
	local lib_name="$2"
	local lib_dependencies="$3"
	local compiler="gfortran"
	local compiler_options="-c -W -fbackslash"
	
	local sep=$( path_separator "$root_path" )
	local lib_path="$root_path"$sep"$lib_name"
	local scr="$lib_path"$sep"scr"
    local obj="$lib_path"$sep"obj"
    local mod="$lib_path"$sep"mod"
    local modules_dir="-J"$mod

    local lib_archive="lib""$lib_name"".a"
	
	
	# Cleaning
    cd "$obj"
    for file in *.o; do
        rm "$file"
    done
	
	# Compilation
    cd "$scr"
	"$compiler" "$compiler_options" "$modules_dir" "$lib_dependencies" *.f90
	
	# Moving new object files
    for file in *.o; do
        mv "$file" "$obj"
    done
	
	# Creation of the archive
    cd $obj
    for file in *.o; do
        ar cr "$lib_archive" "$file"
    done
	
	# Cleaning
	mv "$lib_archive" "$lib_path"
	cd "$root_path"
    echo "$lib_name"" is compiled"
}