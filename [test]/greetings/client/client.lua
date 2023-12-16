AddEventHandler('playerSpawned', function()
    TriggerServerEvent('sv_greeting:show')
end)

RegisterCommand('testGreeting', function()
    TriggerServerEvent('sv_greeting:show')
end)