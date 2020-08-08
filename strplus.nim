import strutils

proc `+`*(first, second:string):string =
    result = first & second
    
proc findAllStartWith*(s, match: string):seq[string] =
    var l = s.split(" ")
    for w in l:
        if w.startsWith(match):
            result.add w

proc boolify*(s:string): bool =
    const truthy = @["yes", "true", "yes", "1", "y"]
    
    if s in truthy:
        return true
    else:
        return false


proc isNum*(s:string): bool =
    try:
        discard s.parseInt()
        return true
    except:
        return false
