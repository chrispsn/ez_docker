#!/bin/bash

# Sets up the container specified by the Dockerfile in the directory.
# Then, runs whatever commands you put afterwards,
# with the current directory mounted into the container under root 
# (with the same name) and used as the current working directory.
# For example:
#
#     /current_directory_name would be the current working directory.
#
# Usage example:
#
#     ./ez_docker.sh bash --version

# For current directory name: http://stackoverflow.com/a/1371283
dir_name=${PWD##*/}

docker build -t $dir_name .

# Quote the path to deal with
#   (a) MSYS requiring double-slash for Windows and 
#   (b) spaces in names
# The weird string at the end allows arbitrary arguments to be passed:
# http://stackoverflow.com/a/4824603
docker run -v "${PWD}"://$dir_name -it -w /$dir_name $dir_name "$@"