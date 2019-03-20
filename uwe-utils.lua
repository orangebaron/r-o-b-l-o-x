local module = {}

function module.checkType(obj, typ)
	assert(type(obj) == typ)
end

function module.checkClass(obj, class)
	module.checkType(obj, "userdata")
	assert(obj.class == class)
end

function module.reduce(func, base, list)
	module.checkType(func, "function")
	module.checkType(list, "table")

	local tot = base
	if type(tot) == "function" then
		tot = tot()
	end

	for k, elem in pairs(list) do
		tot = func(tot, elem, k)
	end
	return tot
end

function module.newList()
	return {}
end

function module.map(func, list)
	module.checkType(func, "function")
	module.checkType(list, "table")

	return module.reduce(
		function (tot, elem, k)
			tot[k] = func(elem)
			return tot
		end,
		module.newList,
		list
	)
end

function module.filter(func, list)
	module.checkType(func, "function")
	module.checkType(list, "table")

	return module.reduce(
		function(tot, elem, k)
			if func(elem) then
				tot[k] = elem
			end
			return tot
		end,
		module.newList,
		list
	)
end
