#!/bin/bash

itercount=('5' '10' '15' '20' '25' '30')
for i in "${itercount[@]}"
do
	echo $i
	~/mallet-2.0.8/bin/mallet train-topics --input ../analysis/web.mallet --num-topics $i \
		--output-state ../analysis/topic-state-${i}.gz --num-iterations 100 \
 		--xml-topic-report ../analysis/topic-report-${i}.xml \
		--output-topic-docs ../analysis/topic-doc-${i}.xml
done
