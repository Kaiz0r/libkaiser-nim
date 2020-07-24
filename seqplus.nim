import json
export json.JsonNode

proc `-`*(a: var seq[any], second:any) =
    for i, v in a:
        if v == second:
            a.delete(i)
            break
        
proc shift*(a:var seq[any]):any=
    result = a[0]
    a.delete(0)

proc copy*(a:seq[string]):seq[string]=
    for en in a:
        result.add(en)
        
proc unshift*(a:var seq[any], newentry:any)=
    let old = a
    a = @[newentry]
    for en in old:
        a.add(en)
    
proc toStrArray*(js:seq[JsonNode]):seq[string]=
    for entry in js:
        result.add(entry.getStr)
        
proc toStrArray*(js:JsonNode):seq[string]=
    for entry in js.getElems():
        result.add(entry.getStr)
