#!/bin/bash

if [ -z "$1" ]
  then
    echo "Usage: $0 path"
    exit 1
fi

HDD_PATH_PREFIX="/media/hdd" # Set to your HDD mount point

real_path=$(realpath "$1")
hdd_path="${HDD_PATH_PREFIX}${real_path}"
hdd_dir=$(dirname "${hdd_path}")/

mkdir -p "${hdd_path}"

# TODO: Perform operation atomically instead of in two steps
mv "${real_path}" "${hdd_dir}"
ln -s "${hdd_path}" "${real_path}"
