
RegisterCommand('coords', function()
  local playerPed = PlayerPedId()
  local playerPos = GetEntityCoords(playerPed)
  print(playerPos)
  lib.setClipboard(playerPos)
end)

RegisterCommand('heading', function()
  local playerPed = PlayerPedId()
  local playerHeading = GetEntityHeading(playerPed)
  print(playerHeading)
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

RegisterCommand('tp', function(source, args)
  local playerPed = PlayerPedId()
  local x = tonumber(args[1])
  local y = tonumber(args[2])
  local z = tonumber(args[3])
  if x and y and z then 
    SetEntityCoords(playerPed, x, y, z, true, false, false, true)
  end
end)
