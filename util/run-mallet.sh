PATH=~/mallet-2.0.8/bin:$PATH
mallet train-topics --input ../temp/web.mallet --num-topics 5 \
 --output-state ../temp/topic-state.gz --num-iterations 10 \
 --xml-topic-report ../temp/topic-report.xml \
 --output-topic-docs ../temp/topic-doc.xml