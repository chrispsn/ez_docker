# in an admin-level PowerShell to enable running non-signed local scripts.
# See http://www.howtogeek.com/106273/how-to-allow-the-execution-of-powershell-scripts-on-windows-7/

# Creates the container specified by the Dockerfile in the script's directory.
# Then, runs whatever commands you put afterwards,
# with the current directory mounted into the container under root 
# (with the same name) and used as the current working directory.
#
# Usage:
#
#     PS ./ez_docker.ps1
#
#     # python3.5 test.py
#
# TODO: Find PowerShell equivalent of "$@" in bash so can do this:
#
#     PS ./ez_docker.PS1 python3.5 test.py

$dir_name = (Get-Item $PSScriptRoot).Name

docker build -t $dir_name .

$dir_path = $PSScriptRoot -replace ":", ""

docker run -v /$dir_path\:/$dir_name -it -w /$dir_name $dir_name
