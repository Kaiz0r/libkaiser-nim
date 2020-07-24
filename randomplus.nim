import json, httpclient, q, xmltree

proc randomDog*(): string =
    let client = newHttpClient()
    let html = parseJson(client.getContent("https://random.dog/woof.json"))
    return html["url"].getStr
    
proc randomShibe*(): string =
    let client = newHttpClient()
    let html = parseJson(client.getContent("http://shibe.online/api/shibes?count=1&urls=true"))
    return html[0].getStr
    
proc randomBird*(): string =
    let client = newHttpClient()
    let html = parseJson(client.getContent("http://shibe.online/api/birds?count=1&urls=true"))
    return html[0].getStr
       
proc randomCat*(): string =
    let client = newHttpClient()
    let html = parseJson(client.getContent("http://aws.random.cat/meow"))
    return html["file"].getStr
    
proc randomBun*(): string =
    result = "https://dotbun.com/"
    let client = newHttpClient()
    result.add(q(client.getContent("https://dotbun.com/")).select("img")[1].attr("src"))
    
proc randomFox*(): string =
    let client = newHttpClient()
    let html = parseJson(client.getContent("https://randomfox.ca/floof/"))
    return html["image"].getStr
