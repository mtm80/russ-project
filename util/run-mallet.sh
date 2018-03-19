PATH=~/mallet-2.0.8/bin:$PATH
mallet train-topics --input ../analysis/web.mallet --num-topics 5 \
 --output-state ../analysis/topic-state.gz --num-iterations 10 \
 --xml-topic-report ../analysis/topic-report.xml \
 --output-topic-docs ../analysis/topic-doc.xml
