# Rhetoric in Russian Presidential Politics

Our project will seek to analyze the language usage of the Russian presidential candidates. Focus will be placed on campaign speeches, advertisements, slogans, etc.. We will investigate how their language corresponds to their respective parties ideologies.

## Candidates
- Владимир Путин [kremlin](http://kremlin.ru)
- Павел Грудинин [campaign](http://grudininkprf.ru/)
- Владимир Жириновский [LDPR leader bio](https://ldpr.ru/leader/)

## Methodology
We're marking up occurrences of the following general patterns
- **Actor description:** ```<actorDesc>``` The way we describe actors or members of a particular society either in a negative or positive way. 
- **Authority:** ```<ru:authority>``` Mentioning authorities to support one's claims.
- **Anecdote:** ```<ru:anecdote>``` Telling a story to make a point
- **Categorization:** ```<ru:cat>``` Assigning people to different groups.
- **Consensus:** ```<ru:consensus>``` Creating agreement and solidarity
- **Disclaimer:** ```<ru:disclaimer>``` Presenting an idea as something positive and then rejecting it by the use of terms such as 'but' in the second sentence.
- **Evidentiality:** ```<ru:evidence>``` Using evidence, true or not, to support one’s ideas. (update schema to represent)
- **Hyperbole:** ```<ru:hyperbole>``` A device for enhancing and exaggerating meaning.
- **Implication:** ```<ru:implication>``` Deducing or inferring implicit information.
- **Irony:** ```<ru:irony>``` Saying something and meaning something else.
- **Lexicalization:** ```<ru:lex>```  an overall ideological strategy for negative other-representation through the semantic features of the words.
- **National Self Glorification:** ```<ru:glory>``` A device to create positive self representation by glorifying one’s country.
- **Number Game:** ```<ru:stats>``` Using numbers and statistics to appear credible.
- **Promise** ```<ru:promise>``` The candidate makes a promise or says "we should"
- **Polarization:** ```<ru:polarization>``` Categorizing allies as having good attributes and opponents having bad attributes.
- **Assumption:** ```<ru:assumption>``` Makes an explicit assumption about something
- **Vagueness:** ```<ru:vague>``` Creating uncertainty and ambiguity.
- **Victimization:** ```<ru:victim>``` Telling bad stories about enemies
- **Conclusion** ```<ru:conclusion>``` Concludes something based on assumptions and evidence posited

## Transformations
All transformations and runner scripts (for on my home machine) are located in the ```/util/``` folder. Run the shell script at the UNIX command line. Requires Python 3.5 or greater.
### util/gen-mystem-input.xslt
This transformation takes a speech that jives with our TEI specification and outputs a plain text document that one can feed as input to [Yandex Mystem](https://tech.yandex.ru/mystem).
### util/flatten-mystem-output.xslt
The transformation takes Mystem output (which uses an ad-hoc XML specification for morphological data) and formats the data so it is compliant with TEI's ```<w>``` tag. This data is then manually fed back into TEI compliant XML, merging the morphological data in its original markup.
