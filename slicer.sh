#!/bin/bash

while getopts ":s:" flag
  do
    case "$flag" in
      s) copies="$OPTARG";;
      *) echo -e "\033[31mError: Wrong flag passed.\033[0m" # Check if -s flag was provided 
      exit 1;;
    esac
  done


if [[ -z "$@" ]]  # Check if flag or argument was entered
  then
    echo -e "\033[31mError: Command requires a flag and an argument.\033[0m"
    exit 1
elif [[ -z "$flag" ]] # Check if flag was entered
  then
    echo -e "\033[31mError: Flag is required.\033[0m"
    exit 1
elif [[ -z "$copies" || ! "$copies" =~ ^[0-9]+$ ]] # Check if $copies is empty or a valid integer
  then
    echo -e "\033[31mError: Flag requires an argument. Enter the number of copies you need.\033[0m"
    exit 1
elif [[ -z "${@:2}" ]]  # Check if files was passed
  then
    echo -e "\033[31mError: Command requires an argument Enter the files that you need copied and shuffled.\033[0m"
    exit 1
fi

# Function to copy and shuffle fiiles
copy_shuffle(){ 
  for copy in $(seq 1 "$copies")
    do
      for each_file in "${@:2}"
        do
          extension="${each_file##.}"
          sort -R "$each_file" > "$copy"."$extension"
        done
    done
    echo -e "\033[32m$(($# -1)) File(s) were copied and shuffled.\033[0m"
}
copy_shuffle "$@"
