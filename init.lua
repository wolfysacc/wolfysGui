local environment = assert(getgenv, "dumb faggot")()

local owner = "wolfysacc"
local branch = "main"

local function import(asset)
    if importCache[asset] then
        return unpack(importCache[asset])
    end
    
    local assets 

    if asset:find("rbxassetid://") then
        assets = { game:GetObjects(asset)[1] }
    elseif web then
        assets = { loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/" .. user .. "/Hydroxide/revision/" .. asset .. ".lua"), asset .. '.lua')() }
    else
        assets = { loadstring(readfile("hydroxide/" .. asset .. ".lua"), asset .. '.lua')() }
    end
    
    importCache[asset] = assets
    return unpack(assets)
end

local function webImport(file)
    return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/wolfysGui/%s/%s.lua"):format(owner, branch, file)), file .. '.lua')()
end

webImport("ui")
