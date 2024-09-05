
function Race(action, data)
    if (action == "open") then
        SendNUIMessage({
            id = "raceui",
            action = action,

            raceIndex = data.index,
            name = data.name,
            
            totalParticipants = data.totalParticipants,
            totalLaps = data.totalLaps,
            totalCheckpoints = data.totalCheckpoints,
        })
    elseif (action == "update") then
        local update = {
            id = "raceui",
            action = "update",
        }

        for k,v in pairs(data) do
            update[k] = v
        end

        SendNUIMessage(update)
    elseif (action == "start" or action == "stop" or action == "close") then
        SendNUIMessage({
            id = "raceui",
            action = action,
        })
    end
end

exports("Race", Race)

RegisterNUICallback("racingUpdate", function(data, cb)
    TriggerEvent("agi_racing:updateRaceData", data)
end)