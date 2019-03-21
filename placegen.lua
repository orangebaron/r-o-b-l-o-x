function read(filename)
	local file = io.open(filename, "r")
	local val = file:read("*all")
	file:close()
	return val
end
function readXml(filename)
	return read("xmlSrc/"..filename..".xml")
end
function readLua(filename)
	return read("luaSrc/"..filename..".lua")
end
function replaceComments(str, comments, replacements)
	local str = str
	for k, v in pairs(comments) do
		str = string.gsub(str, "<!%-%- "..v.." %-%->", replacements[k])
	end
	return str
end

local game = readXml("game")
local service = readXml("service")
local toReplace = {"Lighting", "ReplicatedStorage", "ServerStorage", "StarterPlayer"}
local replacements = {}
for _, r in pairs(toReplace) do
	table.insert(replacements, replaceComments(
		service,
		{"class", "content"},
		{r, readXml(r)}
	))
end

local place = replaceComments(
	readXml("game"),
	toReplace,
	replacements
)
local file = io.open("place.rbxlx", "w")
file:write(place)
file:close()
