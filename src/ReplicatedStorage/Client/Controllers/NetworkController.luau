local NetworkController = {}

function NetworkController.init()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    local client = require(ReplicatedStorage.Client.replicator)
    local JecsUtils = require(ReplicatedStorage.Packages.JecsUtils)
    local Network = ReplicatedStorage.Network

    local updates = JecsUtils.collect(Network.update.OnClientEvent)

    local buf, variants = Network.getFull:InvokeServer()
    client:apply_full(buf, variants)

    RunService.Heartbeat:Connect(function()
        for buf, vars in updates do
            client:apply_updates(buf, vars)
        end
    end)
end

return NetworkController
