local marker = lib.marker.new({
  type = 27,
  coords = Config.truckLocations.blipLocation,
  color = { r= 255, g = 0, b = 0, a = 200},
})

local point = lib.points.new({
  coords = Config.truckLocations.blipLocation,
  distance = 200
})

function point:nearby()
  marker:draw()

  if self.currentDistance < 1.5 then 
    if not lib.isTextUIOpen() then 
      lib.showTextUI("[G] - Spawn Mule")
    end

    if IsControlJustPressed(2, 47) and GetVehiclePedIsIn(PlayerPedId(), false) == 0 then 
      print(PlayerPedId())
      TriggerServerEvent('sv_trucking:spawnMule', GetVehiclePedIsIn(PlayerPedId(), false))
    end
    else if lib.isTextUIOpen() then 
      lib.hideTextUI()
    end
  end
end

function currentVehicle()
  local currentVehicle = GetVehiclePedIsIn(PlayerPedId(), false) 
  local vehicleHash = GetEntityModel(currentVehicle)
  local vehicle = GetDisplayNameFromVehicleModel(vehicleHash)
  return vehicle
end

function selectLocations()
    local randomArea = math.random(#Config.dropoffLocations)
    local randomLocations = math.random(#Config.dropoffLocations[randomArea])
end
RegisterCommand('trucking', function ()
  print(currentVehicle())
  if currentVehicle() == 'MULE' then 
    TriggerServerEvent('sv_trucking:selectLocations', currentVehicle())
  end
end)


