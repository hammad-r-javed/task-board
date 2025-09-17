#!/bin/bash
mkdir static
cd client
./build.sh
cp out/* ../static/
cd ../
