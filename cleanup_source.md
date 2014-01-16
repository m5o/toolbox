# Cleanup/remove trailing whitespace and tabs/spaces

Various task to replace, remove tabs/spaces/trailing whitespaces

## Installation

* copy `cleanup_source.rake` to `lib/tasks/cleanup_source.rake`


## Usage

```bash
rake -T
# there should be this lines
rake source:despace                           # Replace two spaces in source code files with tab
rake source:detab                             # Replace all tabs in source code files with two spaces
rake source:detrail                           # Remove trailing whitespace on the ends of lines
rake source:gsub[pattern,result]              # Replace all instances of {pattern} with {result}
```
