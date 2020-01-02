#!/bin/bash

DIST=$(pwd)/dist
echo $DIST

xcrun momc --no-warnings --verbose ./models/iSisSales.xcdatamodel $DIST/iSisSales.mom
xcrun momc --no-warnings ./models/iSisDriver.xcdatamodel $DIST/iSisDriver.mom
xcrun momc --no-warnings ./models/iSisWarehouse.xcdatamodel $DIST/iSisWarehouse.mom
