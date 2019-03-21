local uwe = {}

function uwe.checkType(obj, typ)
	assert(type(obj) == typ)
end

function uwe.checkClass(obj, class)
	uwe.checkType(obj, "userdata")
	assert(obj.class == class)
end

function uwe.reduce(func, base, list)
	uwe.checkType(func, "function")
	uwe.checkType(list, "table")

	local tot = base
	if type(tot) == "function" then
		tot = tot()
	end

	for k, elem in pairs(list) do
		tot = func(tot, elem, k)
	end
	return tot
end

function uwe.newList()
	return {}
end

function uwe.map(func, list)
	uwe.checkType(func, "function")
	uwe.checkType(list, "table")

	return uwe.reduce(
		function (tot, elem, k)
			tot[k] = func(elem)
			return tot
		end,
		uwe.newList,
		list
	)
end

function uwe.filter(func, list)
	uwe.checkType(func, "function")
	uwe.checkType(list, "table")

	return uwe.reduce(
		function(tot, elem, k)
			if func(elem) then
				tot[k] = elem
			end
			return tot
		end,
		uwe.newList,
		list
	)
end

return uwe
