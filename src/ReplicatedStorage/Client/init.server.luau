local RunService = game:GetService("RunService")
warn("Client loaded")
require(script.replicator)
local network = require(script.Controllers.NetworkController)
network.init()
RunService.Heartbeat:Connect(function()  
    
end)