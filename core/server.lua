local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('qb-SimpleRecycler:stuff', function(source, cb)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(QBCore.Shared.Items["plastic"].name, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["plastic"], "add")
    Player.Functions.AddItem(QBCore.Shared.Items["steel"].name, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["steel"], "add")
end)
