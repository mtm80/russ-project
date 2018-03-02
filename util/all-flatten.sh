#!/usr/bin/env bash

for dir in ../temp/*
        do for subdir in $dir/*;
        do
                ./flatten-mystem-output.sh $subdir/mystem-output.xml $subdir/flat-mystem-output.xml
        done;
done;
