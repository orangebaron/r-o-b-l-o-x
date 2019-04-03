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
	local searchFor = "require%(\""
	local replaceWith1 = "local "
	local replaceWith2 = " = require(game.ServerScriptService."
	while true do
		local start, finish = string.find(modified, searchFor)
		if not start then break end

		local afterwards = string.sub(modified, finish+1)
		local endOfLine, _ = string.find(afterwards, "\"%)")
		local scriptName = string.sub(afterwards, 0, endOfLine - 1)
		local restOfScript = string.sub(afterwards, endOfLine + 1)
		modified =
			string.sub(modified, 0, start-1) ..
			replaceWith1 ..
			scriptName ..
			replaceWith2 ..
			scriptName ..
			restOfScript
	end
	return modified
end
function genServerScriptService()
	local serverScriptService = readXml("mainScript")
	for f in lfs.dir("luaSrc") do
		if f ~= "." and f ~= ".." then
			local strippedFilename = string.sub(f,0,-5)
			local content = replaceRequires(read("luaSrc/" .. f))
			serverScriptService = serverScriptService .. replaceComments(
				moduleScript,
				{"name", "content"},
				{strippedFilename, content}
			)
		end
	end
	return serverScriptService
end
serverScriptService = replaceComments(service, {"class", "content"}, {"ServerScriptService", serverScriptService})

end
function genServices()
	local services = ""
	for f in lfs.dir("xmlSrc/services") do
		services = services .. replaceComments(
			moduleScript,
			{"name", "content"},
			{strippedFilename, content}
		)
	end
	return services .. genServerScriptService()
end

local game = readXml("game")
local service = readXml("service")
local moduleScript = readXml("moduleScript")

local services = ""
for _, r in pairs(toReplace) do
	table.insert(replacements, replaceComments(
		service,
		{"class", "content"},
		{r, readXml(r)}
	))
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
