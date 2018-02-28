I can just use the gen-mystem-input.xslt transform to create input for MALLET. It takes plain text.

```--remove-stopwords``` is helpful to remove stopwords, can import a list of stopwords with ```--stoplist-file [filename]```,
where the file is a whitespace-separated list.

You can use ```--token-regex '[\p{L}\p{M}]+'``` to catch use non-English inputs

This is the command for making topic models ```bin/mallet train-topics --input topic-input.mallet --num-topics 100 --output-state topic-state.gz```

Output will be a text file with each constructed topic on its own line.
