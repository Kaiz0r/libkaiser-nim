import colorize, strutils, os

proc getTimeStamp*():string =
    return ""
    
proc handleVariables(text:string):string =
    result = text
    if "%ts%" in text:
        result = result.replace("%ts%", getTimeStamp())
        
    if "%home%" in text:
        result = result.replace("%home%", getHomeDir())

      
proc log*(tag, text:string ) =
    var t = tag
    case tag:
        of "error":
            t = t.fgRed
        of "update":
            t = t.fgGreen
        of "info":
            t = t.fgBlue
        of "warning":
            t = t.fgRed.bgYellow
    echo " [ "&t&" ] "&text.handleVariables()


proc error*(text:string) =
    stderr.write(text.handleVariables())
            
