local ReplicatedStorage = game:GetService("ReplicatedStorage")
local replecs = require(ReplicatedStorage.Packages.Replecs)
local world = require(ReplicatedStorage.Shared.World)
local client = replecs.create_client(world)

return client