local Types = require(script.Parent.Types)

local Store = {}
Store.__index = Store

function Store.__new(Name: string): Types.Store
	local self = setmetatable({}, Store)

	

	return self
end

return Store