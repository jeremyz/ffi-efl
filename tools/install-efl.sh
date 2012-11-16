#! /bin/bash

WDIR=/tmp/efl
PREFIX="/opt/efl-stable"
VERSION=1.7.1
BASE="http://download.enlightenment.org/releases/"

export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig
export PATH=$PREFIX/bin:$PATH

[ -d $WDIR ] || mkdir $WDIR
for pkg in eina eet eio evas ecore embryo edje e_dbus eeze efreet ethumb emotion elementary; do
    echo "install $pkg-$VERSION into $PREFIX"
    curl $BASE$pkg-$VERSION.tar.gz | tar -xz -C $WDIR
    cd $WDIR/$pkg-$VERSION && ./configure --prefix=$PREFIX && make && make install || exit 1
done
