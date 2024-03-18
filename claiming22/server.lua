claimingStatus = Config.claimingStatus

function checkLicense(source)
    local playerLicense = GetPlayerIdentifierByType(source, 'license')
    if playerLicense ~= Config.allowedLicense then 
        return false
    elseif playerLicense == Config.allowedLicense then
        return true
    end
end

RegisterNetEvent('sv_claiming:startRound', function (roundNumber)
    if not checkLicense(source) then 
        print(GetPlayerName(source) .. " Attempted to start Claiming Round: " .. roundNumber)
    end
    if claimingStatus == true then 
        print(GetPlayerName(source) .. " Attempted to start claiming whilist it's active!")
    elseif roundNumber == 'roundOne' and claimingStatus == false then 
        claimingRound = Config.claimingRounds.roundOne
    elseif roundNumber == 'roundTwo' and claimingStatus == false then 
        claimingRound = Config.claimingRounds.roundTwo
    end
    claimingStatus = true
    TriggerClientEvent('cl_loadClaiming', -1, claimingRound, claimingStatus)
end)


