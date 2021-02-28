local environment = assert(getgenv, "dumb faggot")()

local owner = "wolfysacc"
local branch = "main"

local function webImport(file)
    return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/wolfysGui/%s/%s.lua"):format(owner, branch, file)), file .. '.lua')()
end

webImport("ui")
