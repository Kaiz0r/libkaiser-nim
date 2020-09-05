import strutils

proc `+`*(first, second:string):string =
    result = first & second
    
proc findAllStartWith*(s, match: string):seq[string] =
    var l = s.replace("\n", " ").split(" ")
    for w in l:
        if w.startsWith(match):
            result.add w

proc boolify*(s:string): bool =
    const truthy = @["yes", "true", "yes", "1", "y", "t"]
    
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


#[]proc expandNums(s:string): seq[int] =
    if "," in s:
        for sub in s.split(","):
            for res in expandNums(sub):
                result.add res
            
    if "-" in s:
        let parts = s.split("-")
        for num in range(parts[0].intToStr..parts[1].intToStr):
            result.add num
    else:
        result.add s.strToInt
#]#
