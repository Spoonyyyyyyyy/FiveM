
RegisterCommand('posTest', function()
  TriggerEvent('cl_truckingPosition') 
  TriggerEvent('cl_truckingZones') 
end)
-- Draw3DText
function Draw3DText(x, y, z, scl_factor, text, red, green, blue, alpha)
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local p = GetGameplayCamCoords()
  local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
  local scale = (1 / distance) * 2
  local fov = (1 / GetGameplayCamFov()) * 100
  local scale = scale * fov * scl_factor
  if onScreen then
    SetTextScale(0.0, scale)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(red, green, blue, alpha)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
  end
end

-- Truck Marker

Citizen.CreateThread(function(source)
  local markerPos = vector3(-412.9095, 1169.404, 325.8542)
  local playerPed = PlayerPedId()
    
  while true do 
    local playerCoords = GetEntityCoords(playerPed)
    local distanceCheck = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, markerPos.x, markerPos.y, markerPos.z, true)
    local entityCoords = IsEntityAtCoord(playerPed, markerPos.x, markerPos.y, markerPos.z, 0.5, 0.5, 0.5, 0, 1, 0)
    Citizen.Wait(1)
    DrawMarker(25, markerPos.x, markerPos.y, markerPos.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 0, 255, 0, 75, false, false, 2, false, nil, nil, false)
    if distanceCheck <15 then 
      Draw3DText(markerPos.x, markerPos.y, markerPos.z, 1.0, 'Spawn Mule', 255, 255, 255, 255)
    end
    if IsControlJustPressed(0, 47) and entityCoords == 1 then 
      TriggerServerEvent('sv_spawnMule', distanceCheck)
    end
  end 
end)

-- Trucking Position

RegisterNetEvent('cl_truckingPosition')
AddEventHandler('cl_truckingPosition', function()
  Citizen.Wait(300)
  local playerPed = PlayerPedId()
  local vehicle = GetVehiclePedIsIn(playerPed, false)
  local vehicleBone = GetEntityBoneIndexByName(vehicle, 'indicator_lr')
  print(GetEntityBonePosition_2(vehicle, vehicleBone))
    vehiclePos = CircleZone:Create(GetEntityBonePosition_2(vehicle, vehicleBone), 0.5, {
    name='vehiclePos',
    useZ=true,
    debugPoly=true,
    debugColor= {0, 255, 0}
  })
  vehicleTracking = true
  while vehicleTracking do 
    bonePos = GetEntityBonePosition_2(vehicle, vehicleBone)
    Citizen.Wait(1)
    vehiclePos:setCenter(vector3(bonePos.x, bonePos.y, bonePos.z))

    if IsPedInVehicle(playerPed, vehicle, false) == false then 
      Citizen.Wait(30000)
      print(IsPedInVehicle(playerPed, vehicle, false))
      if IsPedInVehicle(playerPed, vehicle, false) == false then 
        vehiclePos:destroy()
        vehicleTracking = false
      else 
        return 
      end
    end
  end
end)

RegisterNetEvent('cl_truckingZones', function()
  depoZone_1 = CircleZone.Create(vector3(172.8502, 1246.658, 223.0565), 0.5, {
    name='depoZone_1',
    useZ=true,
    debugPoly=true,
    debugColor={255, 0 ,0}
  })
end)