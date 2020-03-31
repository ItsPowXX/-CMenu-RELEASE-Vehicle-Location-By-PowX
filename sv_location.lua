ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('powx_location:Faggio')
AddEventHandler('powx_location:Faggio', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 100
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', source, "~g~Location~w~ effectué !")    
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez d'argent, il vous manque: ~r~$"..price-xMoney.."")
    end       
end)



RegisterNetEvent('powx_location:Blista')
AddEventHandler('powx_location:Blista', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 150
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', source, "~g~Location~w~ effectué !")    
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez d'argent, il vous manque: ~r~$"..price-xMoney.."")
    end       
end)


--By PowX#2629