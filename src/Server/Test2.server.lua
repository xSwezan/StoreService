local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StoreService = require(ReplicatedStorage.lib)

StoreService.OnStart():await()

local MyStore = StoreService.GetStore("MyStore")

print(MyStore.Carrots)
MyStore.Carrots += 1
print(MyStore:PrintCarrots())