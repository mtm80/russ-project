# Rhetoric in Russian Presidential Politics

Our project will seek to analyze the language usage of the Russian presidential candidates. Focus will be placed on campaign speeches, advertisements, slogans, etc.. We will investigate how their language corresponds to their respective parties ideologies.

## Candidates
- Владимир Путин [kremlin](http://kremlin.ru)
- Павел Грудинин [campaign](http://grudininkprf.ru/)
- Владимир Жириновский [LDPR leader bio](https://ldpr.ru/leader/)

## Methodology
We're marking up occurrences of the following general patterns
- **Actor description:** The way we describe actors or members of a particular society either in a negative or positive way.
- **Authority:** Mentioning authorities to support one's claims.
- **Categorization:** Assigning people to different groups.
- **Consensus:** Creating agreement and solidarity
- **Disclaimer:** Presenting an idea as something positive and then rejecting it by the use of terms such as 'but' in the second sentence.
- **Evidentiality:** Using hard facts to support one’s ideas.
- **Hyperbole:** A device for enhancing and exaggerating meaning.
- **Implication:** Deducing or inferring implicit information.
- **Irony:** Saying something and meaning something else.
- **Lexicalization:** an overall ideological strategy for negative other-representation through the semantic features of the words.
- **National Self Glorification:** A device to create positive self representation by glorifying one’s country.
- **Number Game:** Using numbers and statistics to appear credible.
- **Polarization:** Categorizing people as belonging to US with good attributes and THEM with bad attributes.
- **Presupposition:** The common shared knowledge between people or the ideas taken for granted in a proposition.
- **Vagueness:** Creating uncertainty and ambiguity.
- **Victimization:** Telling bad stories about people who do not belong to US

## Transformations
All transformations and runner scripts (for on my home machine) are located in the ```/util/``` folder. Run the shell script at the UNIX command line. Requires Python 3.5 or greater.
### util/gen-mystem-input.xslt
This transformation takes a speech that jives with our TEI specification and outputs a plain text document that one can feed as input to [Yandex Mystem](https://tech.yandex.ru/mystem).
### util/flatten-mystem-output.xslt
The transformation takes Mystem output (which uses an ad-hoc XML specification for morphological data) and formats the data so it is compliant with TEI's ```<w>``` tag. This data is then manually fed back into TEI compliant XML, merging the morphological data in its original markup.
