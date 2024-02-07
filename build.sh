#!/bin/sh

cd ralib
if [ -e ../m2 ]; then
  mvn -Dmaven.repo.local=../m2 package assembly:single
else
  mvn package assembly:single
fi
