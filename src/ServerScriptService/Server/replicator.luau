local ReplicatedStorage = game:GetService("ReplicatedStorage")
local replecs = require(ReplicatedStorage.Packages.Replecs)
local world = require(ReplicatedStorage.Shared.World)
local server = replecs.create_server(world)

return server