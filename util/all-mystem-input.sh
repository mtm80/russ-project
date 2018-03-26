#!/usr/bin/env bash

for dir in ../xml/*
        do for interview in $dir/*.xml;
        do
                candidateDir="$(echo $interview | cut -d/ -f3)"
                interviewDir="$(echo $interview | cut -d/ -f4)"
                mkdir -p ../temp/$candidateDir
                mkdir -p ../temp/$candidateDir/${interviewDir%.*}
                ./gen-mystem-input.sh $interview ../temp/${candidateDir}/${interviewDir%.*}/mystem-input.txt \#$candidateDir
        done;
done;
