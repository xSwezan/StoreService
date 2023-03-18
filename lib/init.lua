local Types = require(script.Types)
local StoreClass = require(script.Store)
local Promise = require(script.Parent.Promise)
local Util = require(script.Util)

local Stores: {[string]: Types.Store} = {}
local Started: boolean = false

local StartedEvent: RBXScriptSignal, FireStarted: () -> nil = Util:NewEvent()

local StoreService = {}

function StoreService.Start()
	return Promise.new(function(resolve)
		for Name: string, Store: Types.Store in Stores do
			if not (type(Store.Init) == "function") then continue end

			Store:Init()
		end

		Started = true
		FireStarted()

		resolve()
	end)
end

function StoreService.OnStart()
	if (Started) then return Promise.resolve() end

	return Promise.fromEvent(StartedEvent)
end

function StoreService.CreateStore(Name: string): Types.Store
	assert(Stores[Name] == nil,`A store with the name '{Name}' already exists!`)

	local NewStore = StoreClass.__new(Name)
	Stores[Name] = NewStore

	return NewStore
end

function StoreService.GetStore(Name: string): Types.Store?
	assert((Started == true),"StoreService has to be started using the .Start() function before using .GetStore()!")
	return assert(Stores[Name],`No store with the name '{Name}' exists!`)
end

function StoreService.debug()
	warn(`- StoreService Debug -\nStarted: {Started}\nServices: `, Stores)
end

return StoreService :: Types.StoreService