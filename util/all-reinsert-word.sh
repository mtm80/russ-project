for dir in ../temp/*
        do for subdir in $dir/*;
        do
                candidateDir="$(echo $subdir | cut -d/ -f3)"
                interviewName="$(echo $subdir | cut -d/ -f4)"
                ./reinsert-structural-word.sh $subdir/flat-output.xml ../xml/${candidateDir}/${interviewName}.xml \#${candidateDir}
        done;
done;