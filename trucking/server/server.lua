RegisterNetEvent('trucking:spawnMule', function ()
    local truckBlipLocation = Config.truckLocations.blipLocation
    if #GetEntityCoords(source) - #truckBlipLocation >1.5 then 
        print('spawn')
    end

end)