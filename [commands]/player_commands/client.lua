RegisterCommand('coords', function()
  local playerPed = PlayerPedId()
  local playerPos = GetEntityCoords(playerPed)
  print(playerPos)
  lib.setClipboard(tostring(playerPos))
end)

RegisterCommand('heading', function()
  local playerPed = PlayerPedId()
  local playerHeading = GetEntityHeading(playerPed)
  print(playerHeading)
  lib.setClipboard(playerHeading)
end)

RegisterCommand('clear', function()
  TriggerEvent('chat:clear')
end)

RegisterCommand('tpm', function()
  local playerPed = PlayerPedId()
  local waypoint = GetFirstBlipInfoId(8)
  local waypointCoords = GetBlipInfoIdCoord(waypoint)
  SetEntityCoords(playerPed, waypointCoords.x, waypointCoords.y, waypointCoords.z, true, false, false, true)
end)

RegisterCommand('vehicleHash', function()
  local playerPed = PlayerPedId()
  local vehicle = GetVehiclePedIsIn(playerPed, false)
  local vehicleHash = GetHashKey(vehicle)
  print (vehicleHash)
end)

CreateThread(function ()
  range = false
end)

RegisterCommand('tp', function(source, args)
  local playerPed = PlayerPedId()
  local x = tonumber(args[1])
  local y = tonumber(args[2])
  local z = tonumber(args[3])
  if x and y and z then 
    SetEntityCoords(playerPed, x, y, z, true, false, false, true)
  end
end)

RegisterCommand('range', function(source, args)
  local distance = args[1]
  print(distance)
  if not range then range = true else range = false end

  while range do 
    Citizen.Wait(1)
    local playerCoords = GetEntityCoords(PlayerPedId())
    DrawMarker(28, playerCoords.x, playerCoords.y, playerCoords.z, 0, 0,0 ,0 ,0 ,0 , 200.0, 200.0, 200.0, 255, 0, 0, 150, false, false, 0, false, nil, nil, false)
  end
end)

RegisterCommand('staticRange', function(source, args)
  local distance = args[1]
  print(distance)
  local playerCoords = GetEntityCoords(PlayerPedId())
  if not range then range = true else range = false end

  while range do 
    Citizen.Wait(1)
    DrawMarker(28, playerCoords.x, playerCoords.y, playerCoords.z, 0, 0,0 ,0 ,0 ,0 , 200.0, 200.0, 200.0, 255, 0, 0, 150, false, false, 0, false, nil, nil, false)
  end
end)
