import parseopt, os

type
    TCMOptHandler = object
        commands*: seq[string]
        flags*: Table[string, string]
        
proc newOptHandler*(): OptHandler =
    result.commands = newSeq[string]()
    result.flags = initTable[string, string]()
    var p = initOptParser()       
    while true:
        p.next()
        case p.kind
        of cmdEnd: break
        of cmdShortOption, cmdLongOption:
            if p.val == "":
                result.flags[p.key] = true
            else:
                result.flags[p.key] = p.val
        of cmdArgument:
            result.commands.add p.key

proc flag*(opt:OptHandler, key, default:string = ""):string =
    if opt.flags.hasKey(key):
        return opt.flags[key]
    else:
        return default

proc getCommand*(opt:OptHandler, default:string = ""):string =
    if opt.commands.len == 0:
        return default
    elif opt.commands.len >= 1:
        return opt.commands[0]
        
proc getCommand*(opt:OptHandler, index:int = 0, default:string = ""):string =
    if opt.commands.len == 0:
        return default
        
    if opt.commands.len <= index:
        return default
    else:
        return opt.commands[index]
        
proc getCommandInt*(opt:OptHandler, default:int = 0):int =
    if opt.commands.len == 0:
        return default.parseInt
    elif opt.commands.len >= 1:
        return opt.commands[0].parseInt
                
proc getCommandInt*(opt:OptHandler, index:int = 0, default:int = 0):int =
    if opt.commands.len == 0:
        return default
        
    if opt.commands.len <= index:
        return default.parseInt
    else:
        return opt.commands[index].parseInt
        

        
