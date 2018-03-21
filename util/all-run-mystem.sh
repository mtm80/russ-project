#!/usr/bin/env bash

for dir in ../temp/*
        do for subdir in $dir/*;
        do
                ~/mystem -c --format xml --weight $subdir/mystem-input.txt $subdir/mystem-output.xml
        done;
done;
