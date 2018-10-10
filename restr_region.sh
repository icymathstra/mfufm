#! /bin/bash

# Main script
lib_mount="C:/work/library/lib_mount_win.sh"

# Launching in current directory
cur_dir=$(pwd)
dir_scr="dir_scr=$cur_dir/"
dir_out="dir_out=$cur_dir/"

# Launching in other directories
#dir_scr='dir_scr=/home/anton/work/project/halo/chp_prop1/'
#dir_out='dir_out=/home/anton/work/project/halo/chp_prop1/'

# Source files and Output executable file
fls_scr="fls_scr=hello_world.f90"
fls_out="fls_out=restr_region.exe"


# File with parameters
param="param=file_with_param.dat"

# Launching in separate window:
#x-terminal-emulator -e $lib_mount $dir_scr $fls_scr $dir_out $fls_out $param

#echo $lib_mount "$dir_scr" "$fls_scr" "$dir_out" "$fls_out" "$param"
# Launching in current window:
$lib_mount "$dir_scr" "$fls_scr" "$dir_out" "$fls_out" "$param"
