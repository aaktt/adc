local NetworkService = {}

function NetworkService.init()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    local ServerScriptService = game:GetService("ServerScriptService")
    local replicator = require(ServerScriptService.Server.replicator)
    local JecsUtils = require(ReplicatedStorage.Packages.JecsUtils)
    local Network = ReplicatedStorage.Network

    local updates_interval = JecsUtils.interval(1 / 20)

    Network.getFull.OnServerInvoke = function(player)
        replicator:mark_player_ready(player)
        return replicator:get_full(player)
    end

    RunService.Heartbeat:Connect(function()
        if updates_interval() then
            for player, buf, variants in replicator:collect_updates() do
                Network.update:FireClient(player, buf, variants)
            end
        end
    end)
end

return NetworkService
