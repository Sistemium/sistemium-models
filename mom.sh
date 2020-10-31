#!/bin/bash

DIST=$(pwd)/dist
echo $DIST

SRC=$(pwd)/models

xcrun momc --no-warnings $SRC/iSisSales.xcdatamodel $DIST/iSisSales.mom
xcrun momc --no-warnings $SRC/iSisDriver.xcdatamodel $DIST/iSisDriver.mom
xcrun momc --no-warnings $SRC/iSisWarehouse.xcdatamodel $DIST/iSisWarehouse.mom
xcrun momc --no-warnings $SRC/vfs.xcdatamodel $DIST/vfs.mom
