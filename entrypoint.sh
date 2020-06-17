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
fi

if [ -n $PGKS ]; then
  apt install -y $PGKS
fi

./auto/configure --with-compat --without-http_gzip_module --without-http_rewrite_module --add-dynamic-module=$CPWD
make modules
if [ $? -ne 0 ]; then
  exit 1;
fi
