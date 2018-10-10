#!/bin/bash
(set -o igncr) 2>/dev/null && set -o igncr; # this comment is needed for Windows system


path_separator()
{
  if [[ "$1" == *[/]* ]]
  then
    local sep="/"
  else
    local sep="\\"
  fi
  echo "$sep"
}


create_library_paths_for_gcc()
{
  local root_path=$1
  local lib_name=$2
  local only_L_path=$3
  
  if [[ "$root_path" == *[/]* ]]
  then
    local sep="/"
  else
    local sep="\\"
  fi

  local lib_path="$root_path""$sep""$lib_name"
  local mod="-I""$lib_path""$sep""mod"
  local lib="-L""$lib_path"" -l""$lib_name"  
  
  if [ "$only_L_path" == "only_L_path" ]; then
      local result_path="$lib"
  else
      local result_path="$mod"" $lib" 
  fi
  echo "$result_path"
}

### Example of usage:
## source create_library_paths_for_gcc.sh # if it used in another script
#root_path="C:/lib/something"
#lib_name="cool"
#result=$( create_library_paths_for_gcc "$root_path" "$lib_name" "only_L_path")
#echo $result

create_paths_for_libraries()
{
    local -a argv=("${@}")
    local -i totlen=${#argv[@]}
    local root_path="${argv[0]}"
    local -a lib_names=("${argv[@]:1:$totlen}")
    local all_paths=""
   
    for lib_name in "${lib_names[@]}"
    do
        if [[ "$lib_name" =~ " only_L_path" ]]; then # if there is substring "only_L_path"
		  lib_name=${lib_name//" only_L_path"/}      # remove "only_L_path" substring
		  lib_paths=$( create_library_paths_for_gcc "$root_path" "$lib_name" "only_L_path")
		  all_paths="$all_paths"" $lib_paths"
		else
          lib_paths=$( create_library_paths_for_gcc "$root_path" "$lib_name")
		  all_paths="$all_paths"" $lib_paths"		
        fi
    done
	
	all_paths="${all_paths## }" # removing of the first space
	echo "$all_paths"
}


### Example of usage:
## source create_paths_for_libraries.sh # if it used in another script
#root_path="C:\work\library"
#declare -a libs=("$root_path" "mfufm" "slatec only_L_path" "physlib" "pulsarlib")
#lib_paths=$( create_paths_for_libraries "${libs[@]}" )
#echo $lib_paths