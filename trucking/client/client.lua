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

local truckBlipLocation = Config.truckLocations.blipLocation

CreateThread(function ()
  while true do
    local playerCoords = GetEntityCoords(PlayerPedId())
    Citizen.Wait(0)

    local distance = GetDistanceBetweenCoords(truckBlipLocation.x, truckBlipLocation.y, truckBlipLocation.z, playerCoords.x, playerCoords.y, playerCoords.z, false)
    DrawMarker(27, truckBlipLocation.x, truckBlipLocation.y, truckBlipLocation.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 255, 100, 0, 255, false, true, 2, true, nil, nil, false)
    if distance < 2.5 then
      Draw3DText(truckBlipLocation.x, truckBlipLocation.y, truckBlipLocation.z + 0.5, 1.0, "Spawn Mule", 255, 255, 255, 255)
      if IsControlJustPressed(2, 47) then
        TriggerServerEvent('trucking:spawnMule')
      end
    end
  end
end)

