#!/bin/sh

cd ralib && mvn -Dmaven.repo.local=../m2 package assembly:single

