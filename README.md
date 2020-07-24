# Nim-libs
Collection of utilities I use for my Nim code. Gets updated whenever I feel like I have some code i'll need re-usable in the future.

## OptHandler [wip, untested]
A simplificating wrapper around Nims command-line handling, to provide easier ways of parsing command lines without iterators.

```nim
# Example command: $ app push all --loop:5 -t
const p = newOptHandler()
echo p.getCommand # push, the first command
echo p.getCommand(1) # all, the second command
echo p.getCommand(2, 'none') # none, because a third command wasnt given
echo p.flag('loop') # 5
echo p.flag('t') # true boolean
echo p.flag('host', 'origin) # origin
```
# strplus
Extra string utils. For now only adds the option of using + instead of & for string concats, purely because I kept accidentally using + and wanted to test making operators. Will have more actually useful things *eventually*.

# seqplus
Extra sequence utils.

```nim
var a = @['one', 'two', 'three']
var b = a.copy() # duplicates and recreates new sequence using same elements
a.shift() # returns index 0 and modifies sequence to remove it
a.unshift('one') # inserts at front

# Also includes a utility for JsonArrays, .toStrArray to convert JsonNode arrays in to arrays of strings
```

# randomplus
Random stuff, i dunno.
At the moment, includes a bunch of functions to get random image API results, like randomDog, randomCat, etc.
