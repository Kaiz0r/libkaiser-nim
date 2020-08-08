# Nim-libs
Collection of utilities I use for my Nim code. Gets updated whenever I feel like I have some code i'll need re-usable in the future.

## OptHandler
A simplificating wrapper around Nims command-line handling, to provide easier ways of parsing command lines without iterators.

```nim
# Example command: $ app push all --loop:5 -t
const p = newOptHandler()
echo p.getCommand # push, the first command
echo p.getCommand(1) # all, the second command
echo p.getCommand(2, "none") # none, because a third command wasnt given
echo p.flag("loop") # 5
echo p.flag("t") # true boolean
echo p.flag("host", "origin") # origin
```

# strplus
Extra string utils.
```nim
proc findAllStartWith*(s, match: string):seq[string]
"this $name is cool".findAllStartWith("$") # returns $name
# returns every word in string that starts with match

proc boolify*(s:string): bool # turns string in to bool, returs true if string is "truthy", e.i. some kind of "yes", "y", "true", "1", else returns false
proc isNum*(s:string): bool # checks if string contains only a number, in the backend, it uses parseInt to check, returns false if parseInt raises an error
```

# seqplus
Extra sequence utils.

```nim
var a = @["one", "two", "three"]
var b = a.copy() # duplicates and recreates new sequence using same elements
a.shift() # returns index 0 and modifies sequence to remove it
a.unshift("one") # inserts at front

# Also includes a utility for JsonArrays, .toStrArray to convert JsonNode arrays in to arrays of strings
```

# randomplus
Random stuff, i dunno.
At the moment, includes a bunch of functions to get random image API results, like randomDog, randomCat, etc.
