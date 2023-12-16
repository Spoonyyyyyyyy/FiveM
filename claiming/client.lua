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


RegisterNetEvent('claiming_marker')
AddEventHandler('claiming_marker', function()
    local markerPos = vector3(-1150.869, -2035.137, 13.16054)  
    local playerPed = PlayerPedId()
    local claiming_blip = AddBlipForCoord(markerPos.x, markerPos.y, markerPos.z)
    local claiming_status = true
    SetBlipSprite(claiming_blip, 303)
    SetBlipScale(claiming_blip, 0.75)
    SetBlipColour(claiming_blip, 6)
    while claiming_status do 
      Citizen.Wait(1)
      local playerCoords = GetEntityCoords(playerPed)
      local distanceCheck = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, markerPos.x, markerPos.y, markerPos.z, true)
      DrawMarker(20, markerPos.x, markerPos.y, markerPos.z-0.1, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.75, 0.75, 0.75, 0, 255, 0, 75, true, false, 2, true, nil, nil, false)
      if distanceCheck <9 then
        Draw3DText(markerPos.x, markerPos.y, markerPos.z+0.50, 1.0, '[G] to Claim', 255, 0, 0, 75)
      end
    end
end)

RegisterNetEvent('claiming_logic')
AddEventHandler('claiming_logic', function()
  local markerPos = vector3(-1150.869, -2035.137, 13.16054)  
  local playerPed = PlayerPedId()
  claiming_logic = true
  while claiming_logic do
    Citizen.Wait(1)
    if IsControlJustPressed(0, 47) == 1 then 
      local entityPos = GetEntityCoords(playerPed)
      local distance = GetDistanceBetweenCoords(entityPos.x, entityPos.y, entityPos.z, markerPos.x, markerPos.y, markerPos.z, true)
      if distance <1 then 
        local player = PlayerId()
        local playerName = GetPlayerName(player)
        TriggerServerEvent('claiming_claim', playerName, distance)
      end
    end
  end
end)

RegisterNetEvent('cl_claimingTimer')
AddEventHandler('cl_claimingTimer', function()
  local timer = 120
  local timing = true 
  TriggerEvent('chat:addMessage', {
    color = {255, 0, 0},
    multiline = false,
    args = {'Claiming', timer .. ' seconds are remaining.'}
  })
  while timing do 
    Citizen.Wait(30000)
    timer = timer - 30
    TriggerEvent('chat:addMessage', {
      color = {255, 0, 0},
      multiline = false,
      args = {'Claiming', timer .. ' seconds are remaining.'}
    })

    if timing == 0 then 
      TriggerEvent('chat:addMessage', {
        color = {255, 0, 0},
        multiline = false,
        args = {'Claiming', 'has ended'}
      })
      CancelEvent()
    end
  end
end)