local Util = {}

function Util:NewEvent(): (RBXScriptSignal, () -> nil)
	local Event: BindableEvent = Instance.new("BindableEvent")
	
	return Event.Event,function(...)
		Event:Fire(...)
	end
end

return Util