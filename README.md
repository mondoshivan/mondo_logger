# Mondo Logger (Ruby Gem)

A simple ruby class offering static logging methods and colorful logging functionality.

## Usage

```
require 'mondo_logger'

Log.print 'say hello'
Log.debug 'say hello'
Log.info 'say hello'
Log.warn 'say hello'
Log.error 'say hello'
Log.fatal 'say hello'
```

*Note: Log.fatal invokes 'exit 1' after logging the string.*


## Format

```
I, [2019-12-20T11:09:13,687050 #5219]  INFO -- example.rb:257:in `block in run': say hallo
```

## File logging

```
require 'mondo_logger'

Log.file = /path/to/my/log.file
Log.info 'start logging'
```