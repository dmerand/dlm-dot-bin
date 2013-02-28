#!/usr/bin/env sh

# FileMaker Database Launcher
# ===========================
#
# **Author:** Donald L. Merand
#
# General template to run ANY FileMaker script.

# Utility to url-encode a string. Could be cleaner than this.
url_encode()
{
  echo $(/usr/bin/env ruby -e "require 'erb'; include ERB::Util; puts url_encode('$1')")
}

# Show the help screen
show_help()
{
  cat <<HELP
FILEMAKRE DATABASE LAUNCHER

Usage - \`launcher <options>\`

Options:
  -h - Show this help screen
  -u - User name
  -p - Password
  -s - Database server (eg. test.database.org)
  -d - Database
  -r - Script Name (optional)
  -m - Parameter (optional)
HELP
}

# Default variables
USER=""
PASS=""
SERVER=""
DATABASE=""
SCRIPT=""
PARAM=""

# Get script options
while getopts ":hu:p:s:d:r:m" OPTNAME
do
  case "$OPTNAME" in
    "h")
      show_help
      exit
      ;;
    "u")
      USER=$(url_encode "${OPTARG}")
      ;;
    "p")
      PASS=$(url_encode "${OPTARG}")
      ;;
    "s")
      SERVER="${OPTARG}"
      ;;
    "d")
      DATABASE=$(url_encode "${OPTARG}")
      ;;
    "r")
      SCRIPT=$(url_encode "${OPTARG}")
      ;;
    "m")
      PARAM=$(url_encode "${OPTARG}")
      ;;
    "?")
      echo "Unknown option $OPTARG"
      ;;
    ":")
      echo "No argument value for option $OPTARG"
      ;;
    *)
    # Should not occur
      echo "Unknown error while processing options"
      ;;
  esac
done


# Param check
if [ -z ${USER} -o -z ${SERVER} ]; then
  show_help
  exit
fi

if [ -z ${DATABASE} ]; then
  show_help
  exit
fi

# Setup
if [ -z ${SCRIPT} ]; then
  URLSCRIPT=""
else
  URLSCRIPT="?script=${SCRIPT}"
fi

if [ -z ${PARAM} ]; then
  URLPARAM=""
else
  URLPARAM="&param=${PARAM}"
fi

# Work
echo opening "fmp://${USER}:${PASS}@${SERVER}/${DATABASE}${URLSCRIPT}${URLPARAM}"
/usr/bin/open "fmp://${USER}:${PASS}@${SERVER}/${DATABASE}${URLSCRIPT}${URLPARAM}"
