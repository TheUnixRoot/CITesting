#!/usr/bin/env bash
url=https://github.com/01org/tbb/archive/2018_U2.tar.gz #
filename=$(basename "$url") #
wget "$url"
tar xzf $filename
mv "tbb-2018_U2" ./tbb-2018