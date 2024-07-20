# Author: Tarungovindk

# Use miniconda to create master python base source

 - Create a venv, source the bin ov venv, Install necessary packages in venv


## Create venv from master python source: 
python -m venv /path/to/new/virtual/environment


## source bin of venv (prepend venv's path to $PATH)
(bash)
export PATH=/path/to/new/virtual/environment:$PATH


## install packages to venv
/path/to/new/virtual/environment/bin/python3 -m pip install <package>


## List all packages installed in venv
/path/to/new/virtual/environment/bin/python3 -m pip list -v
