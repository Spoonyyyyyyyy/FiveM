-- Initial Spawning of Entities

CreateThread(function ()
    Citizen.Wait(2000)
    for k, rockData in ipairs(rockData) do
        local rockCoords, rockModel = rockData.coords, rockData.model
        print(k, rockData)
        local spawnObject = CreateObject(GetHashKey(rockModel), rockCoords.x, rockCoords.y, rockCoords.z, true, true, false)
        rockData.entity, rockData.spawned = spawnObject, true
    end
end)

-- Detection for if a rock isn't spawned every second and if it should be respawned.
CreateThread(function ()
    while true do
        Citizen.Wait(1000)
        for _, v in ipairs(rockData) do 
            local rockModel, rockCoords = v.model, v.coords
            if v.spawnTime == nil then 
                break 
            end
            if not v.spawned and math.floor((GetGameTimer() / 1000) - (v.spawnTime / 1000)) > v.respawnTime then
                local spawnObject = CreateObject(GetHashKey(rockModel), rockCoords.x, rockCoords.y, rockCoords.z, true, true, false)
                v.entity, v.spawned = spawnObject, true
            end
        end
    end
end)

-- Net Event from client to check which rock is being mined.

RegisterNetEvent('main_mining:checkDistance', function (rockIndex)
    local rockCoords = rockData[rockIndex].coords
    local playerCoords = GetEntityCoords(GetPlayerPed(source))
    print("Rock Index: ".. rockIndex, "Player Coords: " .. playerCoords, "Rock Coords: " .. rockCoords)
    if #rockCoords - #playerCoords <3.0 then
        print(GetPlayerName(source) .. ' attempted to mine ' .. rockData[rockIndex].label .. ' at ' .. rockData[rockIndex].coords)
        if DoesEntityExist(rockData[rockIndex].entity) then
            rockData[rockIndex].spawned, rockData[rockIndex].spawnTime = false, GetGameTimer()
            DeleteEntity(rockData[rockIndex].entity)
            local playerIdentifier, playerName = GetPlayerIdentifierByType(source, 'license'), GetPlayerName(source)
            MySQL.insert('INSERT INTO mining_logs (identifier, player_name, label) VALUES (?, ?, ?)', {
                playerIdentifier,
                playerName,
                rockData[rockIndex].label
            }, function ()
                MySQL.scalar('SELECT mining_xp FROM jobs WHERE identifier = ?', {
                    playerIdentifier
                }, function (miningXp)
                    if not miningXp then 
                        MySQL.insert('INSERT INTO jobs (identifier, player_name, mining_xp) VALUES (?, ?, ?)', {
                            playerIdentifier,
                            playerName,
                            rockData[rockIndex].xp
                        })
                    else
                        local updateXp = miningXp + rockData[rockIndex].xp
                        MySQL.update('UPDATE jobs SET mining_xp = ? WHERE identifier = ?', {
                            updateXp,
                            playerIdentifier
                        })
                    end
                end)
            end)
        end
    end
end)

RegisterCommand('removeObjects', function ()
    for k, objects in pairs(rockData) do
        print(k, objects)
        objectId = objects.entity
        print(DoesEntityExist(objectId))
        DeleteEntity(objectId)
    end
end)

RegisterCommand('tableValue', function ()
    for l, p in ipairs(rockData) do
        for o, r in pairs(rockData[l]) do 
        print(o, r)
        end
    end
end)