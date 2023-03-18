local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StoreService = require(ReplicatedStorage.lib)

local MyStore = StoreService.CreateStore("MyStore")

function MyStore:Init()
	self.Carrots = 10
end

function MyStore:PrintCarrots()
	print(self.Carrots)
end

StoreService.Start():await()