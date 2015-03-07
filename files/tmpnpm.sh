#!/bin/bash
 
BASE_DIR=${TMPDIR:-/var/tmp}
ORIG_DIR=$PWD
HASH_CMD="md5sum"
 
DIR_NAME=`echo $PWD | $HASH_CMD | cut -f1 -d " "`
 
TMP_DIR=$BASE_DIR/$DIR_NAME
mkdir -p $TMP_DIR
 
pushd $TMP_DIR >> /dev/null
 
ln -sf $ORIG_DIR/package.json
/usr/bin/npm $1
 
# Can't use archive mode cause of the permissions
rsync --recursive --links --times node_modules $ORIG_DIR
 
popd >> /dev/null
