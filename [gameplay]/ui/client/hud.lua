local raw = LoadResourceFile(GetCurrentResourceName(), GetResourceMetadata(GetCurrentResourceName(), 'postal_file'))
local postals = json.decode(raw)

local hud = config.setDefaultHud()

local lastStreetArea = ""
local hudHidden = false
local adminMap = false

Citizen.CreateThread(function()
    while true do
    
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        -- street labels
        local str1, str2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
        local streetLabel = "| " .. GetStreetNameFromHashKey(str1)
        local streetArea  = config.zones[GetNameOfZone(pos.x, pos.y, pos.z)] or lastStreetArea
        local time = "00:00"
        lastStreetArea = streetArea
        
        if (str2 ~= 0) then streetLabel = streetLabel .. " & " .. GetStreetNameFromHashKey(str2) end
        
        -- clock time 
        if (GetClockHours() < 10) then
            time = "0" .. GetClockHours()
        else
            time = GetClockHours()
        end

        if (GetClockMinutes() < 10) then
            time = time .. ":0" .. GetClockMinutes()
        else
            time = time .. ":" .. GetClockMinutes()
        end

        -- postals
        local ndm = -1 -- nearest distance magnitude
        local ni = -1 -- nearest index
        for i, p in ipairs(postals) do
            local dm = (pos.x - p.x) ^ 2 + (pos.y - p.y) ^ 2 -- distance magnitude
            if ndm == -1 or dm < ndm then ni = i ndm = dm end
        end

        -- top bar with street names
        hud.location.data_1 = streetLabel 

        -- bottom bar with area | postcode | time
        hud.location.data_2 = streetArea .. " | " .. postals[ni].code .. " | " .. time
        
        -- sends in raw heading in a float
        hud.location.direction = math.floor((GetEntityHeading(ped)))
        

        Wait(1000)
    end
end)

local gpsEnabled = true
local isBig = false
RegisterNetEvent("ag_ui:toggleGPS")
AddEventHandler("ag_ui:toggleGPS", function()
    local hasGPS = exports["ag_inventory"]:getItem("gps")

    if not gpsEnabled and hasGPS then
        Aspire.Notification("GPS Enabled")
        gpsEnabled = true
        SetRadarBigmapEnabled(false, false)
        PlaySoundFrontend(-1, "Event_Message_Purple", "GTAO_FM_Events_Soundset", true)
    elseif gpsEnabled then
        gpsEnabled = false
        PlaySoundFrontend(-1, "Out_Of_Area", "DLC_Lowrider_Relay_Race_Sounds", 0)   
        Aspire.Notification("GPS Disabled")
        SetRadarBigmapEnabled(false, false)
    else
        gpsEnabled = false
        Aspire.Notification("GPS Disabled")
        SetRadarBigmapEnabled(false, false)
    end
end)

RegisterNetEvent("ag_ui:disableGPS")
AddEventHandler("ag_ui:disableGPS", function()
    if gpsEnabled then
        gpsEnabled = false
        SetRadarBigmapEnabled(false, false)
        TriggerEvent("ag_ui:SendNotification", "GPS Disabled")
    end
end)

function degreesToIntercardinalDirection( dgr )
	dgr = dgr % 360.0
	
	if (dgr >= 0.0 and dgr < 22.5) or dgr >= 337.5 then
		return "N "
	elseif dgr >= 22.5 and dgr < 67.5 then
		return "NE"
	elseif dgr >= 67.5 and dgr < 112.5 then
		return "E"
	elseif dgr >= 112.5 and dgr < 157.5 then
		return "SE"
	elseif dgr >= 157.5 and dgr < 202.5 then
		return "S"
	elseif dgr >= 202.5 and dgr < 247.5 then
		return "SW"
	elseif dgr >= 247.5 and dgr < 292.5 then
		return "W"
	elseif dgr >= 292.5 and dgr < 337.5 then
		return "NW"
	end
end

function drawText( str, x, y, style )
	if style == nil then
		style = {}
	end
	
	SetTextFont( (style.font ~= nil) and style.font or 0 )
	SetTextScale( 0.0, (style.size ~= nil) and style.size or 1.0 )
	SetTextProportional( 1 )
	
	if style.colour ~= nil then
		SetTextColour( style.colour.r ~= nil and style.colour.r or 255, style.colour.g ~= nil and style.colour.g or 255, style.colour.b ~= nil and style.colour.b or 255, style.colour.a ~= nil and style.colour.a or 255 )
	else
		SetTextColour( 255, 255, 255, 255 )
	end
	
	if style.shadow ~= nil then
		SetTextDropShadow( style.shadow.distance ~= nil and style.shadow.distance or 0, style.shadow.r ~= nil and style.shadow.r or 0, style.shadow.g ~= nil and style.shadow.g or 0, style.shadow.b ~= nil and style.shadow.b or 0, style.shadow.a ~= nil and style.shadow.a or 255 )
	else
		SetTextDropShadow( 0, 0, 0, 0, 255 )
	end
	
	if style.border ~= nil then
		SetTextEdge( style.border.size ~= nil and style.border.size or 1, style.border.r ~= nil and style.border.r or 0, style.border.g ~= nil and style.border.g or 0, style.border.b ~= nil and style.border.b or 0, style.border.a ~= nil and style.shadow.a or 255 )
	end
	
	if style.centered ~= nil and style.centered == true then
		SetTextCentre( true )
	end
	
	if style.outline ~= nil and style.outline == true then
		SetTextOutline()
	end
	
	SetTextEntry( "STRING" )
	AddTextComponentString( str )
	
	DrawText( x, y )
end

-----------------------------------
Citizen.CreateThread(function()
    while PlayerData.job == nil do
        Wait(250)
    end

    SetMinimapClipType(1)
    DisplayRadar(0)
    SetRadarBigmapEnabled(true, false)
    Citizen.Wait(0)
    SetRadarBigmapEnabled(false, false)
    DisplayRadar(1)
end)

Citizen.CreateThread(function()
    SetMapZoomDataLevel(0, 0.96, 0.9, 0.08, 0.0, 0.0) -- Level 0
    SetMapZoomDataLevel(1, 1.6, 0.9, 0.08, 0.0, 0.0) -- Level 1
    SetMapZoomDataLevel(2, 8.6, 0.9, 0.08, 0.0, 0.0) -- Level 2
    SetMapZoomDataLevel(3, 12.3, 0.9, 0.08, 0.0, 0.0) -- Level 3
    SetMapZoomDataLevel(4, 24.3, 0.9, 0.08, 0.0, 0.0) -- Level 4
    SetMapZoomDataLevel(5, 55.0, 0.0, 0.1, 2.0, 1.0) -- ZOOM_LEVEL_GOLF_COURSE
    SetMapZoomDataLevel(6, 450.0, 0.0, 0.1, 1.0, 1.0) -- ZOOM_LEVEL_INTERIOR
    SetMapZoomDataLevel(7, 4.5, 0.0, 0.0, 0.0, 0.0) -- ZOOM_LEVEL_GALLERY
    SetMapZoomDataLevel(8, 11.0, 0.0, 0.0, 2.0, 3.0) -- ZOOM_LEVEL_GALLERY_MAXIMIZE
end)

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        hud.id = "hud"
        hud.hide = hudHidden

        hud.health = math.floor(GetEntityHealth(ped) - 100)
        hud.armour = math.floor(GetPedArmour(ped))

        if IsPedSwimmingUnderWater(PlayerPedId()) then
            hud.oxy = GetPlayerUnderwaterTimeRemaining(PlayerId()) * 2.5
        else
            hud.oxy = 0
        end

        hud.voice.active = NetworkIsPlayerTalking(PlayerId())

        if (isDead or hud.health > 100) then hud.health = 0 end

        if (IsPauseMenuActive()) then
            hud.hide = true
        end

        hud.vehicle.inVehicle = IsPedInAnyVehicle(ped, false)
        if (hud.vehicle.inVehicle) then
            local veh = GetVehiclePedIsIn(ped, false)
            hud.vehicle.fuel = math.floor(getVehicleFuel(veh))
            hud.vehicle.speed = math.floor(GetEntitySpeed(veh) * 3.6)
            hud.vehicle.type = "car"

            if (hud.vehicle.fuel < 0) then
                hud.vehicle.fuel = 0.0
            end

            local class = GetVehicleClass(veh)
            if (class == 15 or class == 16) then 
                hud.vehicle.type = "air"
            end

            if hud.vehicle.type == "air" then
                hud.vehicle.speed = math.floor(GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false)) * 0.539957)
            end
        end

        SendNUIMessage(hud)
        
        if not isDead and gpsEnabled then
            DisplayRadar(true)
        elseif (hudHidden) then
            DisplayRadar(false)
        else
            DisplayRadar(hud.vehicle.inVehicle or adminMap)
        end
        

        Wait(250)
    end
end)

Citizen.CreateThread(function()
    SetRadarBigmapEnabled(true, false)
    Wait(0)
    SetRadarBigmapEnabled(false, false)

    while true do

        if (IsControlPressed(1, 19)) then
			if (IsControlJustPressed(1, 74)) then
                hudHidden = not hudHidden
			end
		end

		HideHudComponentThisFrame(3)
		HideHudComponentThisFrame(4)
		HideHudComponentThisFrame(6)
		HideHudComponentThisFrame(7)
		HideHudComponentThisFrame(8)
		HideHudComponentThisFrame(9)

        Wait(1)
    end
end)

function getPlayerDirection(ped)
    return config.directions[math.floor((GetEntityHeading(PlayerPedId()) + 22.5) / 45.0)] .. " Bound"
end

function getPlayerLocation(ped)
    local pos = GetEntityCoords(PlayerPedId())
    local str1, str2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
    return GetStreetNameFromHashKey(str1) .. ", " .. lastStreetArea
end

function getCoordsLocation(pos)
    local a = config.zones[GetNameOfZone(pos.x, pos.y, pos.z)]
    local str1, str2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
    if (a) then return GetStreetNameFromHashKey(str1) .. ", " .. a end
    return GetStreetNameFromHashKey(str1)
end

function getVehicleFuel(veh)
    if (DecorExistOn(veh, "vehicleFuel")) then
        return DecorGetFloat(veh, "vehicleFuel")
    else
        return 0.0
    end
end

RegisterNetEvent("setRange")
AddEventHandler("setRange", function(newVoice)
    hud.voice.level = newVoice
end)

RegisterNetEvent("agi_ui:belt")
AddEventHandler("agi_ui:belt", function(newBelt)
    hud.vehicle.seatbelt = newBelt
end)

RegisterNetEvent("ag_ui:toggle")
AddEventHandler("ag_ui:toggle", function(toggle)
    hudHidden = not toggle
end)

function sendAppEvent(app, data, withExtra)
    SendNUIMessage({
        action = app,
        data = data
    })
end

exports("sendAppEvent", sendAppEvent)

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(1)
		if IsPedOnFoot(GetPlayerPed(-1)) then 
			SetRadarZoom(1100)
		elseif IsPedInAnyVehicle(GetPlayerPed(-1), true) then
			SetRadarZoom(1100)
		end
    end
end)