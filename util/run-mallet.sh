#!/bin/bash

~/mallet-2.0.8/bin/mallet train-topics --input ../analysis/web.mallet --num-topics 30 \
	--output-state ../analysis/topic-state.gz --num-iterations 100 \
 	--xml-topic-report ../analysis/topic-report.xml \
	--output-topic-docs ../analysis/topic-docs.csv
