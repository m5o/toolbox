# Cleanup/remove trailing whitespace and tabs/spaces

Various task to replace, remove tabs/[double] spaces/trailing whitespaces

## Installation

* copy `cleanup_source.rake` to `lib/tasks/cleanup_source.rake`


## Usage

```bash
rake -T

rake source:decurlysbracketspace              # wip - Rewrite curly brackets without leading/trailing space for single line blocks
rake source:dedouble                          # Remove double whitespace between words in a line
rake source:derocket                          # Rewrite hash rocket syntax for all symbol hash keys
rake source:despace                           # Replace two spaces in source code files with tab
rake source:detab                             # Replace all tabs in source code files with two spaces
rake source:detrail                           # Remove trailing whitespace on the ends of lines
rake source:gsub[pattern,result]              # Replace all instances of {pattern} with {result}
```
