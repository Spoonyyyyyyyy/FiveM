CreateThread(function ()
    respawnObjects = {
        objectId = {},
        gameTime = {},
        rockIndex= {}
    }
    for k, rockData in ipairs(rockData) do
        local rockCoords = rockData.coords
        local rockModel = rockData.model
        print(k, rockData)
        local spawnObject = CreateObject(GetHashKey(rockModel), rockCoords.x, rockCoords.y, rockCoords.z, true, true, false)
        table.insert(respawnObjects.objectId, spawnObject)
        table.insert(respawnObjects.gameTime, GetGameTimer())
        table.insert(respawnObjects, i)
    end
    while true do 
        Citizen.wait(1000)
        for _, tableData in ipairs(respawnObjects) do 
            local objectId, gameTimer, rockIndex = tableData.objectId, tableData.gameTime, tableData.rockIndex
            local currentGameTimer = GetGameTimer()
        
            if math.floor(math.abs(currentGameTimer - gameTimer) / 1000) < rockData[rockIndex].respawnTime and IsEntityAtRockCoord(objectId, rockIndex) then
                print(rockData[rockIndex].label .. ' has respawned at ' .. rockData[rockIndex].label)
            end
        end
        
        function IsEntityAtRockCoord(objectId, rockIndex)
            local rockCoords = rockData[rockIndex].coords
            return IsEntityAtCoord(objectId, rockCoords.x, rockCoords.y, rockCoords.z, 1.0, 1.0, 1.0, 0, 1, 0)
        end  
    end
end)

RegisterNetEvent('main_mining:checkDistance', function (rockIndex, playerCoords)
    print(rockIndex)
    print(playerCoords)
    local rockCoords = rockData[rockIndex].coords
    print(rockCoords)
    if #rockCoords - #playerCoords >1.5 then 
        print(GetPlayerName(source), 'attempted to mine' .. rockData[rockIndex].label, 'at' ,rockData[rockIndex].coords)
    end
end)

AddEventHandler('onResourceStop', function ()
    for k, objects in pairs(respawnObjects.objectId) do
        print(k, objects)
        objectId = objects
        print(DoesEntityExist(objectId))
        DeleteEntity(objectId)
    end
 end)


RegisterCommand('removeObjects', function ()
    for k, objects in pairs(respawnObjects.objectId) do
        print(k, objects)
        objectId = objects
        if DoesEntityExist(objectID) then 
            print(DoesEntityExist(objectId))
            DeleteEntity(objectId)
        end
    end
end)
