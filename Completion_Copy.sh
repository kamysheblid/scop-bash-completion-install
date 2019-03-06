#!/usr/bin/env bash

# I made this program because I wanted to use https://github.com/scop/bash-completion 
# without `$make install`ing it. So I copied (SRC_DIR)/bash_completion into 
# /etc/bash_completion/completions/ and then I wanted to only copy the completion scripts 
# of the programs I have, so this script I made does that.

# To use it pass in the directory of the bash-completion src directory.
# My src directory was in the home directory, so I would do this at the cli 
# `$sudo ./Completion_Copy.sh ~/bash-completion`

SRC_DIR=$1
echo $SRC_DIR
for file in `ls $SRC_DIR/completions/`;
	do ( [[ -e /bin/$file ]] || [[ -e /sbin/$file ]] || [[ -e /usr/bin/$file ]] || [[ -e /usr/sbin/$file ]] ) &&
	       echo -n "Copying $file ..." &&
	       cp $SRC_DIR/$file /usr/share/bash-completion/completions/ &&
	       echo "done"
done;
