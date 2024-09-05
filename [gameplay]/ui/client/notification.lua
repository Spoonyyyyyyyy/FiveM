local function sendNotification(d)
    SendNUIMessage(d)
end 

RegisterNetEvent("ag_ui:sendNotification")
AddEventHandler("ag_ui:sendNotification", function(key, title, message, data)
    local d = config.setDefaultNotification()
    data = data or {}
    d.title = title
    d.type.key = key or nil
    d.data.message = message

    d.options.timeout = data.timeout or 4000
    d.data.messageIcon = data.messageIcon or ''
    d.options.position = data.position or "bottom-right"

    sendNotification(d)
end)

RegisterNetEvent("ag_ui:dispatchNotification")
AddEventHandler("ag_ui:dispatchNotification", function(key, job, title, message, data, position)
    local d = config.setDefaultNotification()
    d.title = title

    d.type.key = key
    d.type.job = job

    d.data.code = data.code
    d.data.message = message
    d.data.messageIcon = data.messageIcon or nil
    d.data.callsign = data.callsign
    d.data.location = data.location
    d.type.priority = data.priority
    d.data.direction = data.direction
    d.options.timeout = data.timeout or 10000
    d.options.position = data.position or "top-right"
    d.overrides.headerBackground = data.headerBackground

    if position then
        local dist = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), position.x, position.y, position.z)
        local formattedDist = string.format("%.2f", dist/1000) .. "km"
        d.data.location = d.data.location .. " | " .. formattedDist
    end

    sendNotification(d)
end)

RegisterNetEvent("ag_ui:SendNotification")
AddEventHandler("ag_ui:SendNotification", function(message, data)
    local data = data or {}
    TriggerEvent("ag_ui:sendNotification", nil, "", message, { messageIcon = data.icon, timeout = data.timeout, position = data.layout})
end)