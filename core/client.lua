local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    local closestBin = {
        'prop_rub_carwreck_11',
        'prop_rub_carwreck_5',
        'prop_rub_carwreck_12',
        'prop_rub_carwreck_10',
        'prop_rub_carwreck_13',
        'prop_rub_carwreck_17',
        'prop_rub_carwreck_2',
        'prop_rub_carwreck_9',
        'prop_rub_carwreck_14',
        'prop_rub_carwreck_15',
        'prop_rub_carwreck_3',
        'prop_rub_carwreck_8',
        'prop_rub_carwreck_16',
        'prop_rub_carwreck_7'
    }
    CreateThread(function()
        exports['qb-target']:AddTargetModel(closestBin, {
            options = {
                {
                    id = 'bank',
                    event = 'qb-SimpleRecycler:dosomething',
                    icon = 'fas fa-money-check-alt',
                    label = 'Watch that',
                },
            },
            distance = 1.5,
        })
    end)
end)

RegisterNetEvent('qb-SimpleRecycler:dosomething', function(entity)
    QBCore.Functions.Progressbar('search_register', 'Do Something..', 8500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'amb@prop_human_bum_bin@base',
        anim = 'base',
        flags = 50,
    }, {}, {}, function()
        QBCore.Functions.TriggerCallback('qb-SimpleRecycler:stuff', function(result)
        end)
        ClearPedTasks(PlayerPedId())
        StopAnimTask(GetPlayerPed(-1), 'amb@prop_human_bum_bin@base', 'base', 1.0)
        QBCore.Functions.Notify('You found something?')
    end, function()
        GetMoney = false
        StopAnimTask(GetPlayerPed(-1), 'amb@prop_human_bum_bin@base', 'base', 1.0)
        ClearPedTasks(GetPlayerPed(-1))
        QBCore.Functions.Notify('Nothing..', 'error')
    end)
end)
