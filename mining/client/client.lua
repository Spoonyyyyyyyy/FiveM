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
            if IsControlJustPressed(0, 58) then
                for i, rockData in ipairs(rockData) do 
                    local rockCoords = rockData.coords
                    local playerCoords = GetEntityCoords(PlayerPedId())
                    local rockIndex = i
                    local distanceRock = GetDistanceBetweenCoords(rockCoords.x, rockCoords.y, rockCoords.z, playerCoords.x, playerCoords.y, playerCoords.z, true)
                    print(rockIndex, distanceRock)
                    if distanceRock <3.0 then
                        RequestAnimDict('anim@heists@fleeca_bank@drilling')
                        while not HasAnimDictLoaded("anim@heists@fleeca_bank@drilling") do 
                            Citizen.Wait(100)
                        end
                        local drillObject = CreateObject(GetHashKey("hei_prop_heist_drill"), playerCoords.x, playerCoords.y, playerCoords.z, true, true, false)
                        AttachEntityToEntity(drillObject, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.14, 0, -0.01, 90.0, -90.0, 180.0, true, true, false, true, 1, true)
                        TaskPlayAnim(PlayerPedId(), 'anim@heists@fleeca_bank@drilling', 'drill_straight_idle' , 3.0, 3.0, -1, 1, 0, false, false, false)
                        Citizen.Wait(10000)
                        StopAnimTask(PlayerPedId(), "anim@heists@fleeca_bank@drilling", "drill_straight_idle", 1.0)
                        DetachEntity(drillObject, true, true)
                        DeleteObject(drillObject)
                        TriggerServerEvent('main_mining:checkDistance', i, playerCoords)
                        print("Rock Index: " .. rockIndex, "Distance from Rock: " .. distanceRock)
                    end
                end
            end
        end
    end
end)

