# Make sure you first run 'Set-ExecutionPolicy RemoteSigned' 
# in an admin-level PowerShell to enable running non-signed local scripts.
# See http://www.howtogeek.com/106273/how-to-allow-the-execution-of-powershell-scripts-on-windows-7/
#
# Creates the container specified by the Dockerfile in the script's directory.
# Then, runs whatever commands you put afterwards,
# with the current directory mounted into the container under root 
# (with the same name) and used as the current working directory.
#
# Usage example:
#
#     PS ./ez_docker.ps1 bash --version

$dir_name = (Get-Item $PSScriptRoot).Name

docker build -t $dir_name .

$dir_path = $PSScriptRoot -replace ":", ""

docker run -v /$dir_path\:/$dir_name -it -w /$dir_name $dir_name $args