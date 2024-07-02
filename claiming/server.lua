RegisterCommand('claimingStart', function()
    TriggerClientEvent('claiming_marker', -1)
    TriggerClientEvent('claiming_logic', -1)
    TriggerClientEvent('cl_claimingTimer', -1)
end)

RegisterNetEvent('claiming_claim')
AddEventHandler('claiming_claim', function(playerName, distance)
    if distance <1 then 
        if playerName == currentClaim then
            return 
        end

        currentClaim = playerName
        TriggerClientEvent('chat:addMessage', -1, {
            color = {255, 0, 0},
            multiline = false,
            args = {'Claiming', playerName .. " has claimed the blip!"}
        })
        print(playerName .. " has claimed the blip!")
    end
end)
