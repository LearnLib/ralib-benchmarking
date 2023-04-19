#!/bin/bash

cd ralib

mvn -DskipTests=true assembly:assembly

cd ..
