# helper script for calculating the sha 256 hash for the brew formula
# download the .tar.gz from the github releases page, e.g. `https://github.com/acarl005/ls-go/releases`
# then pass the resulting file path to this command
shasum -a 256 $1

