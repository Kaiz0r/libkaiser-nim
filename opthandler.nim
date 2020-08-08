import parseopt, tables, strutils, json
export parseopt.initOptParser

type
    TCMOptHandler = object
        commands*: seq[string]
        flags*: Table[string, string]
        
#proc registerCommand(opt: var TCMOptHandler, name: string, fn: proc(args: seq[string], flags: Table[string, string]), help: string)
proc parseArgTable*():JsonNode =
    var p = initOptParser()
    var args = %*{}
    args[":args"] = newJArray()          
    while true:
        p.next()
        case p.kind
        of cmdEnd: break
        of cmdShortOption, cmdLongOption:
            if p.val == "":
                args[p.key] = newJBool(true)
            else:
                args[p.key] = newJString(p.val)
        of cmdArgument:
            args[":args"].add(newJString(p.key))
            
    return args
    
proc newOptHandler*(): TCMOptHandler =
    result.commands = newSeq[string]()
    result.flags = initTable[string, string]()
    var p = initOptParser()       
    while true:
        p.next()
        case p.kind
        of cmdEnd: break
        of cmdShortOption, cmdLongOption:
            if p.val == "":
                result.flags[p.key] = "true"
            else:
                result.flags[p.key] = p.val
        of cmdArgument:
            result.commands.add p.key

#proc registerCommand(opt: var TCMOptHandler, name: string, fn: proc(args: seq[string], flags: Table[string, string]), help: string) =
    #opt.commandls[name] = Command(execute: fn, help: help)
            
proc flag*(opt:TCMOptHandler, key, default:string = ""):string =
    if opt.flags.hasKey(key):
        return opt.flags[key]
    else:
        return default
        
proc command*(opt:TCMOptHandler, default:string = ""):string =
    if opt.commands.len == 0:
        return default
    elif opt.commands.len >= 1:
        return opt.commands[0]
        
proc command*(opt:TCMOptHandler, index:int = 0, default:string = ""):string =
    if opt.commands.len == 0:
        return default
        
    if opt.commands.len <= index:
        return default
    else:
        return opt.commands[index]
        
proc commandInt*(opt:TCMOptHandler, default:int = 0):int =
    if opt.commands.len == 0:
        return default
    elif opt.commands.len >= 1:
        return opt.commands[0].parseInt()
                
proc commandInt*(opt:TCMOptHandler, index:int = 0, default:int = 0):int =
    if opt.commands.len == 0:
        return default
        
    if opt.commands.len <= index:
        return default
    else:
        return opt.commands[index].parseInt()
        

        
