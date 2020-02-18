#!/bin/bash

DIST=$(pwd)/dist
echo $DIST

xcrun momc --no-warnings ./models/iSisSales.xcdatamodel $DIST/iSisSales.mom
xcrun momc --no-warnings ./models/iSisDriver.xcdatamodel $DIST/iSisDriver.mom
xcrun momc --no-warnings ./models/iSisWarehouse.xcdatamodel $DIST/iSisWarehouse.mom
xcrun momc --no-warnings ./models/vfs.xcdatamodel $DIST/vfs.mom
