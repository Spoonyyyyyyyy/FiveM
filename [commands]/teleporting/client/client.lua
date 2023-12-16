RegisterCommand('goto', function (_, args)
    local tPlayer = args[1]
    if not tPlayer then
        TriggerEvent('chat:addMessage', {
            color = {255,0 , 0},
            multiline = true,
            args = {'ID:', " Enter a player ID!"}
        })
    end
    TriggerServerEvent('teleporter:goto', tPlayer)
end)

RegisterCommand('bring', function (_, args)
    local tPlayer = args[1]
    if not tPlayer then 
        TriggerEvent('chat:addMessage', {
            color = {255,0 , 0},
            multiline = false,
            args = {'ID:', " Enter a player ID!"}
        })
    end
    TriggerServerEvent('teleporter:bring', tPlayer)
end)