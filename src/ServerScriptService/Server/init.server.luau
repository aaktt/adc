warn("Server is running")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local replicator = require(script.replicator)
local network = require(script.Parent.Engine.Services.NetworkService)
network.init()

Players.PlayerAdded:Connect(function(player: Player)  

end)