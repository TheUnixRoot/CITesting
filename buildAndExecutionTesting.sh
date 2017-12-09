#!/bin/bash
mode=debug
git=https://github.com/TheUnixRoot/CITesting.git
url=https://github.com/01org/tbb/archive/2018_U2.tar.gz
git clone "$git"
filename=$(basename "$url")
wget "$url"
tar xzf $filename
mv "tbb-2018_U2" ./tbb-2018
cd ./tbb-2018
make
cd build
mv *_debug linux_debug
mv *_release linux_release
source "linux_$mode"
cd ../..
cmake --build ./CITesting/cmake-build-debug --target prPractica2
prPractica2 > ../log.txt
cd ..
pause
rm -r $OLDPWD 