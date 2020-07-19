#/bin/bash

OUTFILE=$(mktemp -t highlight)

INFILE=$1
PARAM="set nonumber"

if [ -z "$INFILE" ]
then
    echo "usage: $0 source.file"
    exit
fi

vim +"$PARAM" \
    +'let html_use_css=1' \
    +'TOhtml' \
    +'/<pre>/,/<\/pre>/d a' \
    +'g/./d' \
    +'1pu! a' \
    +'$d' \
    +"wq! $OUTFILE" \
    +'q!' $INFILE &>/dev/null

cat $OUTFILE && rm $OUTFILE
