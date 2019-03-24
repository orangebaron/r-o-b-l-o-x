require("lfs")

function read(filename)
	local file = io.open(filename, "r")
	local val = file:read("*all")
	file:close()
	return val
end
function readXml(filename)
	return read("xmlSrc/"..filename..".xml")
end
function replaceComments(str, comments, replacements)
	local str = str
	for k, v in pairs(comments) do
		str = string.gsub(str, "<!%-%- "..v.." %-%->", replacements[k])
	end
	return str
end
function readLua(filename)
	local val = read("luaSrc/"..filename..".lua")
	return val
end
function replaceRequires(source)
	local modified = source
	local searchFor = "require(\""
	local loc = 0
	while true do
		--TODO
		loc += 1
		if loc >= string.len(modified) - string.len(searchFor) then break end
	end
	return modified
end

local game = readXml("game")
local service = readXml("service")
local script = readXml("script")

local toReplace = {"Lighting", "ReplicatedStorage", "ServerStorage", "StarterPlayer"}
local replacements = {}
for _, r in pairs(toReplace) do
	table.insert(replacements, replaceComments(
		service,
		{"class", "content"},
		{r, readXml(r)}
	))
end

local serverScriptService = ""
for f in lfs.dir("luaSrc") do
	if f ~= "." and f ~= ".." then
		local strippedFilename = string.sub(f,0,-5)
		local content = replaceRequires(read("luaSrc/"..f))
		serverScriptService = serverScriptService..replaceComments(
			script,
			{"name", "content"},
			{strippedFilename, content}
		)
	end
end
table.insert(toReplace, "ServerScriptService")
table.insert(replacements, serverScriptService)

local place = replaceComments(
	readXml("game"),
	toReplace,
	replacements
)

local file = io.open("place.rbxlx", "w")
file:write(place)
file:close()
