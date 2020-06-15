#!/bin/sh

REF=$1
CPWD=`pwd`
NPATH=/tmp/nginx
if [ -d $NPATH ]; then
  rm -rf $NPATH
fi
git clone https://github.com/nginx/nginx $NPATH
if [ $? -ne 0 ]; then
  exit 1;
fi
cd $NPATH
if [ -n $REF ]; then
  git checkout $REF
fi

./auto/configure --with-compat --add-dynamic-module=$CPWD
make modules

