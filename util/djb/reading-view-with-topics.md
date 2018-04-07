# Insert MALLET topics into reading view

Response to <https://github.com/obdurodon/dh_course/issues/65>

## Files (in `djb` branch in [russ-project/util/djb](..)):

* [reading-view-with-topics.md](reading-view-with-topics.md): This file
* [interviu-vladimira-putina-francuzskoy-gazete-le-figaro.xml](interviu-vladimira-putina-francuzskoy-gazete-le-figaro.xml): Sample XML interview file, for transformation, copied from [russ-project/xml/putin/interviu-vladimira-putina-francuzskoy-gazete-le-figaro.xml](../../xml/putin/interviu-vladimira-putina-francuzskoy-gazete-le-figaro.xml)
* [topic-report-30.xml](topic-report-30.xml): MALLET topics with keywords, with human-readable topic names added where appropriate, copied from [russ-project/analysis/topic-report-30.xml](../../analysis/topic-report-30.xml)
* [test\_transformation\_with\_topics.xsl](test_transformation_with_topics.xsl): Sample XSLT transformation to XHTML5 with MALLET topics added as `@class` values on `<span>` elements.
* [test_output.xhtml](test_output.xhtml): Sample XHTML5 output.

## Explanation

### Major features

* XSLT typically transforms a single XML input file to a single output file. It is possible, though, to read additional files by using the `doc()` function. That strategy is used here to make the MALLET topics file accessible to the transformation without recourse to `<xsl:include>` or `<xsl:import>`, and without needing to transform them separately to an interim format.
* Retrieving MALLET topics (recorded in the `@name` attribute of selected `<topic>` elements in the MALLET topics file) is possible with simple XPath, but because the same lookups are performed repeatedly, it is (much) faster to use `<xsl:key>` to create a hashed lookup table, which can then be accessed with XPath `key()` function. We’ve used a key to retrieve the human-readable names of the interview participants, as well.

### Other details

* The input document is not valid against its schema. That doesn’t matter for transformation (which requires only well-formedness), but it should be fixed.
* We are using `@name` values from the input as `@class` values in the output, and one `@name` value contains spaces: “quality of life”. The HTML `@class` attribute contains a sequence of whitespace-separated word tokens; that is, a `@class` value of “quality of life” would be parsed as belonging to three independent classes, one for each word. To avoid this error, we replace the spaces with underscores. Additionally, because some MALLET topics share the same `@name` value, we deduplicate the values before string-joining them and writing them into the output.
* We pass silently through the semantic elements in the `ru:` namespace. In Real Life we would probably want to transform them into some representation in the output.
* We don’t set a default input namespace (using `@xpath-default-namespace`). Since the main input file is in the TEI namespace and the MALLET topics file is in no namespace, this means that we use a namespace prefix to address the main input file.
* We strip all whitespace nodes with `<xsl:strip-space elements="*">` and then restore spaces where we need them after specific `<w>` elements. The result isn’t easy to read (= could probably be improved). As far as the browser view is concerned, this whitespace handling isn’t necessary, since the browser normalizes whitespace during rendering, but it makes the raw HTML easier to read.
* We’ve changed the value of the `@exclude-result-prefixes` attribute on the document node to `#all`, so that unused namespace declarations will not be copied into the output.