#!/bin/bash

OUTFILE=$(mktemp -t syntax)

vim +'so $VIMRUNTIME/syntax/hitest.vim' \
    +'let html_use_css=1' \
    +'TOhtml' \
    +'v/^\./d' \
    +"wq! $OUTFILE" \
    +'q!' &>/dev/null

cat $OUTFILE && rm $OUTFILE