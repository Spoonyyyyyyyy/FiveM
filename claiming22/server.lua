allowedLicense = 'license:0ea3bf0403ac5097276535391d9e40ebc3386d77'
local claimingStatus = {
    claimingActive = false, 
    spawnsActive = {
        status = false,
        teamA = nil,
        teamB = nil
    },
    currentClaim = {
        identifier = nil,
        sourceId = nil,
        name = nil
    }
}

function checkLicense(source)
    local playerLicense = GetPlayerIdentifierByType(source, 'license')
    if playerLicense ~= allowedLicense then 
        return false
    elseif playerLicense == allowedLicense then
        return true
    end
end

function setTeamSpawns()
    if claimingStatus.spawnsActive.status == false and claimingStatus.spawnsActive.teamA == nil then 
        return teamA 
    elseif claimingStatus.spawnsActive.status == false and claimingStatus.spawnsActive.teamB == nil then
        return teamB 
    elseif claimingStatus.spawnsActive.status == false and claimingStatus.spawnsActive.teamA ~= nil and claimingStatus.spawnsActive.teamB ~= nil then
        return spawnSet
    end
end

RegisterNetEvent('sv_createClaiming', function (playerCoords)
    if not checkLicense(source) then
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true,
            args = {"System", "You don't have permission to execute this command!"}
        })
        return
    end
    if not claimingStatus.spawnsActive.status then 
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true, 
            args = {"System", "You need to place down team spawn locations!"}
        })
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Claiming Spawns',
            description = 'Press G to place down team A spawns',
            type = 'success'
        })
        TriggerClientEvent('cl_clamingSpawns', source, true, teamA)
    end
end)
