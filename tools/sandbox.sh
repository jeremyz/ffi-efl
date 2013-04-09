#! /usr/bin/env bash

EFL_DIR=/opt/efl-release
export PKG_CONFIG_PATH=$EFL_DIR/lib/pkgconfig
export LD_LIBRARY_PATH=$EFL_DIR/lib
$@
