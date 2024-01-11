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
        local spawnObject = CreateObject(GetHashKey(rockModel), rockCoords.x, rockCoords.y, rockCoords.z, true, false, false)
        table.insert(respawnObjects.objectId, spawnObject)
    end
end)

RegisterNetEvent('main_mining:checkDistance', function (rockIndex, playerCoords)
    print(rockIndex)
    print(playerCoords)
    if rockIndex or playerCoords == nil then 
        return 
    end
    local rockCoords = rockData[rockIndex].coords
    print(rockCoords)
    if #rockCoords - #playerCoords >1.5 then 
        print(GetPlayerName(source), 'attempted to mine' .. rockData[RockIndex].coords, rockData[RockIndex].label)
    end
end)

--[[ AddEventHandler('onResourceStop', function ()
    for k, object in ipairs(rockData) do 
        entity = object.entity
    SetObjectAsNoLongerNeeded(object.entity)
    DeleteObject(entity)
    end
 end)
--]]
RegisterCommand('removeObjects', function ()
    for k, objects in pairs(respawnObjects.objectId) do
        print(k, objects)
        objectId = objects
        TriggerClientEvent('main_mining:removeObjects', -1, objectId)
    end
end)