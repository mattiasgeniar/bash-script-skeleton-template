#!/bin/bash
########################################################################
#
# Script:    describe what the function of this script is
# Author:    Mattias Geniar
# Contact:   <m@ttias.be>
#
# Changelog (sorted newest -> oldest):
#   - 2014-10-04: updated draft
#   - 2014-10-03: first draft
#
#
########################################################################

# Create a few constants that can be used further in the script
VERSION=0.1.0

# Determine some basic information, used later in the script
this_path=$(readlink -f $0)        ## Path of this file including filename
dir_name=`dirname ${this_path}`    ## Dir where this file is
myname=`basename ${this_path}`     ## file name of this script.
logfile="${myname}.log"

# Create several routines for handling our "common" use cases: help, log, output, ...
# Routine: display help usage to the user
function help {
  echo "
  usage: $myname [options]

  -h           optional  Print this help message
  -q           optional  Suppress log messages on screen, just log them.
  -f           optional  Force
  -i <file>    required  input file
  -l <log>     optional  print errors and output to this file.
               default ${myname}.log
  -o <outdir>  optional  store output here.
               default is <put ur default here>"
  exit 1
}

# Routine: log to a file
function log {
  current_timestamp=`date`
  if [[ $quiet == "true" ]]
  then
    echo $current_timestamp ": " $1 1>> $logfile
  else
    echo $current_timestamp ": " $1 | tee -a $logfile
  fi
}

log "Script called"

# If no arguments are passed to this script, it should always show the usage info.
# The script will never perform any action unless the necessary parameters are explicitly used.
if [ $# == 0 ] ; then
  # Show the help usage
  help
  exit 1;
fi

# Put your main code here.
function main {
  help
}

# Bootstrap the script. Nothing much to do here.
main "$@"