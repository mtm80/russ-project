#!/usr/bin/env bash

for dir in ../temp/*
        do for subdir in $dir/*;
        do
                ./gen-mallet-input.sh $subdir/flat-output.xml $subdir/mallet-input.txt
        done;
done;
