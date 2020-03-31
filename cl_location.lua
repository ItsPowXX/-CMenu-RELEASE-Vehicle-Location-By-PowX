ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

local pLocation = {
    Base = { Title = "Location" },
    Data = { currentMenu = "Choisissez votre véhicule" },
    Events = {

        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
            if btn.name == "Faggio" then

                TriggerServerEvent('powx_location:Faggio')

                PlaySoundFrontend( -1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)

                Citizen.Wait(2)

                spawnCar("faggio")

                end

            if btn.name == "Blista" then

                TriggerServerEvent('powx_location:Blista')

                PlaySoundFrontend( -1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
    
                Citizen.Wait(2)
    
                spawnCar("blista")
    
                end
        end,
    },

    Menu = {

        ["Choisissez votre véhicule"] = {
            b = {
                {name = "Véhicule", ask = ">>>", askX = true},
                {name = "---------------------------------------------------------------------" },
                {name = "Scooter", ask = ">>>", askX = true},
            }
        },

        ["véhicule"] = {
            b = {
                {name = "Blista", ask = "~g~150$", askX = true},
            }
        },

        ["scooter"] = {
            b = {
                {name = "Faggio", ask = "~g~100$", askX = true},
            }
        },
    }
}


-- Function du spawn Vehicule--

spawnCar = function(car)

    local car = GetHashKey(car)



    RequestModel(car)

    while not HasModelLoaded(car) do

        RequestModel(car)

        Citizen.Wait(1)

    end


    local vehicle = CreateVehicle(car, -973.55, -2693.21, 13.83, 149.61, true, false)

    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleNumberPlateText(vehicle, "LOUER")
end


---PED---

Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_y_business_02")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_LOCATION", "a_m_y_business_02", -969.68, -2693.18, 12.83, 148.35, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end)



-- Blip -- 

Citizen.CreateThread(function()
    local blip = AddBlipForCoord(-969.68,  -2693.18,  12.83) --Coordonées du blip
    SetBlipSprite (blip,  225) -- Forme du blip
    SetBlipScale (blip, 0.7) -- taille du blip
    SetBlipDisplay(blip, 4) -- Souvent utilisé 4 pour l'afficher sur la minimap et la carte 
    SetBlipColour (blip, 49) -- choix de couleur 
    SetBlipAsShortRange(blip, true) -- Cacher le blip sur la mini map lorsque le joueur est loin

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Location de véhicule') -- Mettre le nom du Blip
    EndTextCommandSetBlipName(blip)
end)




-- Coordonner Menu ---

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if Vdist2(GetEntityCoords(PlayerPedId(), false), -970.39, -2693.96, 13.83) < 1.2 then
            if IsControlJustPressed(1,51) then 
                CreateMenu(pLocation)
            end
        end
    end
end)


--By PowX2629