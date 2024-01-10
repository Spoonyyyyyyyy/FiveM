CreateThread(function ()
    spawnedObject = {}
    for k, rockData in ipairs(rockData.stone) do
        rockCoords = rockData.coords
        rockModel = rockData.model
        print(k, rockData)
        local spawnObject = CreateObject(GetHashKey(rockModel), rockCoords.x, rockCoords.y, rockCoords.z, true, false, false)
    end
end)
