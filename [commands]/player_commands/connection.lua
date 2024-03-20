AddEventHandler("playerConnecting", function (name, setKickReason, deferrals)
    local identifiers = GetPlayerIdentifiers(source)
    local license = identifiers[1]
    local discord = identifiers[2]
    local fivem = identifiers[3]
    local license2 = identifiers[4]
    if not isPlayerInDatabase(license, discord, fivem, license2) then
        addPlayerToDataBase(license, discord, fivem, license2)
    end
end)

function isPlayerInDatabase(license, discord, fivem, license2)
    MySQL.scalar('SELECT fivem FROM users WHERE fivem = ?', {
        fivem
    }, function (value)
        if value == nil then 
            MySQL.insert.await("INSERT INTO `users` (license, discord, fivem, license2) VALUES (?, ?, ?, ?)", {
                license,
                discord,
                fivem,
                license2
            })
        end
    end)
end

function addPlayerToDatabase(license, discord, fivem, license2)
    
end