seatsActive = false
gameActive = false
gameType = nil

RegisterNetEvent('cyberbar:enable_games', function ()
    print('a')
    for i, v in pairs(Config.seatMarkers) do
        print(i, v)
    end
end)