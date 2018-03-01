# Yandex Mystem

Mystem runs a morphological analysis on Russian text. Mystem is special because it doesn't only use a dictionary to look up lemmas, but it uses context and grammar rules to guess if something isn't in the dictionary.

## Installation

Mystem supports Windows, Mac, and Linux. Just download the newest version [here](https://tech.yandex.ru/mystem/), extract it from the archive, .tar.gz on Linux and Mac, .zip on Windows. On Linux and Mac, use "chmod +x [filename]``` on the binary file to make it executable. On Windows, just run the .exe.

## Usage

```$ mystem [options] [input-file] [output-file]```

<table>
        <tr>
                <td><code>-n</code></td>
                <td>Print every word on a new line</td>
        </tr>
        <tr>
                <td><code>-c</code></td>
                <td>
                        <p>Copy the entire input into the output. This includes not only words, but all the stuff between words.</p>
                        <p>This option is very helpful for full representation of the original text.</p>
                        <p>If you're using option <code>-n</code>, whitespace will be escaped to <code>\n</code> or <code>\r</code>.</p>
                        <p>Spaces are converted to underscores, for maximum visibility</p>
                        <p><code>\</code> is escaped to <code>\\</code>, and <code>_</code> to <code>\_</code></p>
                </td>
        </tr>
        <tr>
                <td><code>-w</code></td>
                <td>Only print dictionary words</td>
        </tr>
        <tr>
                <td><code>-l</code></td>
                <td>Don't print the input words, just the lemmas and grammemes</td>
        </tr>
        <tr>
                <td><code>-i</code></td>
                <td>Print the gramatical information, with the decoding below</td>
        </tr>
        <tr>
                <td><code>-g</code></td>
                <td>Include word form information for one lemma</td>
        </tr>
        <tr>
                <td><code>-c</code></td>
                <td>Print an end-of-sentence marker</td>
        </tr>
        <tr>
                <td><code>-e</code></td>
                <td>Declare the input/output encoding. Can be cp866, cp1251, koi8-r, utf-8. utf-8 is the default.</td>
        </tr>
        <tr>
                <td><code>-d</code></td>
                <td>Use context to pick among homonyms</td>
        </tr>
        <tr>
                <td><code>--eng-gr</code></td>
                <td>Print the english designation of the grammemes</td>
        </tr>
        <tr>
                <td><code>--filter-gram</code></td>
                <td>Run the analysis only with known grammemes</td>
        </tr>
        <tr>
                <td><code>--fixlist</code></td>
                <td>Use an ad-hoc dictionary (format not specified)</td>
        </tr>
        <tr>
                <td><code>--format [text|xml|json]</code></td>
                <td>Output format, text is the default.</td>
        </tr>
        <tr>
                <td><code>--generate-all</code></td>
                <td>Generate all possibilities for non-dictionary words</td>
        </tr>
        <tr>
                <td><code>--weight</code></td>
                <td>Print the certainty of the generated lemmas</td>
        </tr>
</table>
