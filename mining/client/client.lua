RegisterCommand('toggleMining', function ()
    if miningActive == false then
        miningActive = true 
        print(miningActive)
        return
    end
    if miningActive == true then 
        miningActive = false
        print(miningActive)
        return
    end
end)

CreateThread(function ()
    miningActive = false
    while true do
        Citizen.Wait(1)
        if miningActive then
            Citizen.Wait(1)
            if IsControlJustPressed(0, 58) then
                for i, rockData in ipairs(rockData) do 
                    local rockCoords = rockData.coords
                    local playerCoords = GetEntityCoords(PlayerPedId())
                    local rockIndex = i
                    local distanceRock = GetDistanceBetweenCoords(rockCoords.x, rockCoords.y, rockCoords.z, playerCoords.x, playerCoords.y, playerCoords.z)
                    Citizen.Wait(500)
                    print(rockIndex, distanceRock)
                    if distanceRock <1.5 then
                        TriggerServerEvent('main_mining:checkDistance', i, playerCoords)
                        return
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('main_mining:removeObjects', function (objectId)
    print(objectId)
    SetObjectAsNoLongerNeeded(objectId)
    DeleteObject(objectId)
end)