#!/bin/bash
mode=debug # or release
git=https://github.com/TheUnixRoot/CITesting.git #
url=https://github.com/01org/tbb/archive/2018_U2.tar.gz #
git clone "$git"
filename=$(basename "$url") #
wget "$url"
tar xzf $filename
mv "tbb-2018_U2" ./tbb-2018
cd ./tbb-2018
make
cd build
filename=$(ls | egrep _$mode) #
echo $filename
cd $filename
chmod 777 tbbvars.sh
sed -i -e "s/$filename/linux_$mode/g" tbbvars.sh
cd ..
mv $filename linux_$mode
chmod 777 "linux_$mode/tbbvars.sh"
source "linux_$mode/tbbvars.sh"
cd ../../CITesting
mkdir cmake-build-$mode
cd cmake-build-$mode
cmake ..
make
cd ../../
./CITesting/cmake-build-$mode/prPractica2 > ../log.txt
read -n1 -p "Press any key to clean workspace Ctrl-C otherwise"
yes | rm -r ./* 