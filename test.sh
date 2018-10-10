#!/bin/bash
(set -o igncr) 2>/dev/null && set -o igncr; # this comment is needed for Windows system


lib_path=$(dirname "$(readlink -f "$0")")
cd $lib_path
#cd ..
root_path=$(pwd)

path_format="cygwin"

if [[ "$path_format" == "cygwin" ]]
then
    root_path="$(cygpath -w "$root_path")"
fi	
#echo "$root_path"

source create_paths_for_libraries.sh

#root_path="C:\work\library"
declare -a libs=("$root_path" "mfufm" "slatec only_L_path" "physlib" "pulsarlib" "lapack only_L_path")
required_libs=$( create_paths_for_libraries "${libs[@]}" )
echo $lib_paths


# Source and output files

sep=$( path_separator "$root_path" )

lib_name="crproplib"
lib_path="$root_path"$sep"$lib_name"
scr="$lib_path"$sep"scr"
obj="$lib_path"$sep"obj"
mod="$lib_path"$sep"mod"
modules_dir="-J"$mod

lib_archive="lib""$lib_name"".a"

echo scr="$scr"
echo obj="$obj"
echo mod="$mod"
echo lib_archive="$lib_archive"

#declare -p libs

myFunArray=( "1st field" "2nd  field" "3rd       field" )
myVar="$( declare -p myFunArray )"
echo tttt="${myVar#*=}"

tt=$(echo *.sh)
echo tt="$tt"
