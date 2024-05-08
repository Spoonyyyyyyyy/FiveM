AddEventHandler("playerConnecting", function (name, setKickReason, deferrals)
    local identifiers = GetPlayerIdentifiers(source)
    local license = identifiers[1]
    local discord = identifiers[2]
    local fivem = identifiers[3]
    local license2 = identifiers[4]
    isPlayerInDatabase(license, discord, fivem, license2, source, name)
end)

function isPlayerInDatabase(license, discord, fivem, license2, playerSource, name)
    MySQL.scalar.await('SELECT fivem FROM users WHERE fivem = ?', {
        fivem
    }, function (value)
        if value == nil then 
            MySQL.insert("INSERT INTO `users` (name, NetID, license, discord, fivem, license2) VALUES (?, ?, ?, ?, ?, ?)", {
                name,
                playerSource,
                license,
                discord,
                fivem,
                license2,
            })
        else
            MySQL.update.await("UPDATE `users` SET name = ?, NetID = ? WHERE fivem = ?", {
                name,
                playerSource,
                fivem,
            })
        end
    end)
end

