#!/bin/sh

REF=$1
PGKS=$2

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
  if [ $? -ne 0 ]; then
    exit 1;
  fi
fi

if [ -n $PGKS ]; then
  apt-get install -y $PGKS
  if [ $? -ne 0 ]; then
    exit 1;
  fi
fi

./auto/configure --with-compat --add-dynamic-module=$CPWD
if [ $? -ne 0 ]; then
  exit 1;
fi
make modules
if [ $? -ne 0 ]; then
  exit 1;
fi
find . -name *.so -exec cp {} $CPWD \;
