mkdir -p ../temp/mallet-input/

#candidates=(putin zhirinovskii grudinin)
for c in putin zhirinovskii grudinin
        do for interview in $(echo ../temp/${c}/*)
        do
                interviewName="$(echo $interview | cut -d/ -f4)"
                cp ${interview}/mallet-input.txt ../temp/mallet-input/${c}-${interviewName}.txt
        done
done
~/mallet-2.0.8/bin/mallet import-dir --keep-sequence --input ../temp/mallet-input --output ../analysis/web.mallet --stoplist-file ../research/stop-words.txt --token-regex '[\p{L}\p{M}]+'
