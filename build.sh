#!/bin/bash

git submodule init
git submodule update

cd ralib

mvn assembly:assembly

cd ..
