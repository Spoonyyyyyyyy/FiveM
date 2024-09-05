Config = {}

Config.hosts = {'license:0ea3bf0403ac5097276535391d9e40ebc3386d77'}

Config.gamemode = nil

Config.seatsActive = false
Config.gameActive = false
Config.gameType = nil

Config.gameInstance = nil

Config.arenaStatus = {
    loaded = false,
    scene = nil,
    props = nil
}

Config.teams = {
    Alpha = {
        playerSource = {},
        alive = 0
    },
    Beta = {
        playerSource = {},
        alive = 0
    }
}

Config.arenaPos = vector3(2800.123, -3698.778, 140.001)

Config.arenaOptions = {
    dystopian = {
        scene = {
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_Scene")',
        },
         props = {
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_01")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_02")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_03")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_04")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_05")',                
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_06")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_07")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_08")',
        }
      
    },
        scifi = {
        scene = {
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Scifi_Scene")',      
        },
        props = {
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Scifi_01")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Scifi_02")',              
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Scifi_03")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Scifi_04")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Scifi_05")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Scifi_06")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Scifi_07")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Scifi_08")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Scifi_09")',
        }
    },
    wasteland = {
        scene = {
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Wasteland_Scene")'
        },
        props = {
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Wasteland_01")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Wasteland_02")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Wasteland_03")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Wasteland_04")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Wasteland_05")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Wasteland_06")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Wasteland_07")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Wasteland_08")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Wasteland_09")',
        }
    }
}

Config.seatMarkers = {
    {seatIndex = 1, team = 'Alpha', status = false, coords = vec3(-130.577408, 1004.190369, 235.732117), playerId = nil},
    {seatIndex = 2, team = 'Alpha', status = false, coords = vec3(-128.577408, 1004.190369, 235.732117), playerId = nil},
    {seatIndex = 3, team = 'Alpha',status = false, coords = vec3(-126.577408, 1004.190369, 235.732117), playerId = nil},
    {seatIndex = 4, team = 'Alpha', status = false, coords = vec3(-124.577408, 1004.190369, 235.732117), playerId = nil},
    {seatIndex = 5, team = 'Alpha', status = false, coords = vec3(-122.577408, 1004.190369, 235.732117), playerId = nil},
    {seatIndex = 6, team = 'Beta', status = false, coords = vec3(-130.577408, 999.190369, 235.732117), playerId = nil},
    {seatIndex = 7, team = 'Beta', status = false, coords = vec3(-128.577408, 999.190369, 235.732117), playerId = nil},
    {seatIndex = 8, team = 'Beta', status = false, coords = vec3(-126.577408, 999.190369, 235.732117), playerId = nil},
    {seatIndex = 9, team = 'Beta', status = false, coords = vec3(-124.577408, 999.190369, 235.732117), playerId = nil},
    {seatIndex = 10, team = 'Beta', status = false, coords= vec3(-122.577408, 999.190369, 235.732117), playerId = nil}
}

Config.weaponOptions = {
    'weapon_pistol_mk2',
    'weapon_appistol',
    'weapon_pistol50',
    'weapon_microsmg',
    'weapon_smg',
    'weapon_smg_mk2',
    'weapon_assaultsmg',
    'weapon_machinepistol',
    'weapon_minismg',
    'weapon_assaultrifle',
    'weapon_assaultrifle_mk2',
    'weapon_carbinerifle',
    'weapon_carbinerifle_mk2',
    'weapon_advancedrifle',
    'weapon_specialcarbine',
    'weapon_specialcarbine_mk2',
    'weapon_bullpuprifle',
    'weapon_bullpuprifle_mk2',
    'weapon_compactrifle',
    'weapon_mg',
    'weapon_combatmg',
    'weapon_combatmg_mk2',
}



Config.cyberbarPresets = {
    sandyairfield = {
        spawn1 = vector3(2111.755, 4787.62, 41.24374),
        spawn2 = vector3(1300.519, 1100.453, 105.6565),
        claim = vector3(1582.058, 3201.421, 40.51103),
    },
    airport = {
        spawn1 = vector3(-1622.709, -1003.197, 13.05061),
        spawn2 = vector3(1147.813, -1508.336, 34.69254), 
        claim = vector3(-1025.409, -2712.294, 13.81808), 
    },
    pinkcage = {
        spawn1 = vector3(939.9361, -163.3592, 74.53098), 
        spawn2 = vector3(-503.9371, -279.3709, 35.62235),
        claim = vector3(319.7725, -225.7769, 54.03987),
    },
    observatory = {
        spawn1 = vector3(-1460.078, 872.2114, 183.5438),
        spawn2 = vector3(820.3214, 1270.275, 360.4542),
        claim = vector3(-407.4567, 1184.676, 325.5283),
    },
    planeyard = {
        spawn1 = vector3(224.254, 2622.453, 46.84678),
        spawn2 = vector3(2434.362, 5114.668, 46.98994),
        claim = vector3(2397.878, 3108.256, 48.19555),
    },
    oilfields = {
        spawn1 = vector3(903.9025, -51.74815, 78.76402),
        spawn2 = vector3(190.6267, -3000.616, 5.753891),
        claim = vector3(1576.342, -1697.697, 88.15991),
    },
    vineyard = {
        spawn1 = vector3(-2204.219, 4251.422, 47.51363),
        spawn2 = vector3(-2307.952, 424.3603, 174.4666),
        claim = vector3(-1906.601, 2029.453, 140.7397),
    },
    quarry =  {
        spawn1 = vector3(1512.627, 6481.608, 21.97342),
        spawn2 = vector3(2292.353, -433.8044, 88.40795),
        claim = vector3(2682.259, 2836.506, 40.09439),
    },
    roxwood = {
        spawn1 = vector3(-2205.706, 4250.003, 47.49427),
        spawn2 = vector3(2605.23, 5084.148, 44.75537),
        claim = vector3(-239.7917, 7053.263, 12.15842),
    },
    hippiehill = {
        spawn1 = vector3(1120.582, 2648.931, 37.99644),
        spawn2 = vector3(1421.936, 6503.521, 19.70572),
        claim = vector3(2626.018, 3663.597, 101.5633),
    },
    vespucciapartments = {
        spawn1 = vector3(-201.1157, -2032.892, 27.62076),
        spawn2 = vector3(-1915.743, 731.8424, 141.1651),
        claim = vector3(-1309.879, -1091.923, 6.992709),
    },
    chumash = {
        spawn1 = vector3(-769.4792, 5531.181, 33.47886),
        spawn2 = vector3(-1158.975, -1740.186, 4.05163),
        claim = vector3(-3174.648, 1108.478, 20.83528),
    },
    baytree = {
        spawn1 = vector3(898.7883, -70.69761, 78.76402),
        spawn2 = vector3(-1738.937, 2876.004, 32.80652),
        claim = vector3(-90.71137, 1890.174, 197.1469),
    },
    grapeseed = {
        spawn1 = vector3(2575.188, 378.3987, 108.4569),
        spawn2 = vector3(-772.1122, 5533.75, 33.48154),
        claim = vector3(2068.808, 5010.058, 41.017),
    },
    youtool = {
        spawn1 = vector3(1471.343, 753.2068, 77.45785),
        spawn2 = vector3(1440.811, 6485.89, 20.69092),
        claim = vector3(2780.618, 3464.016, 55.43395),
    },
    church = {
        spawn1 = vector3(-3004.697, 119.3742, 14.74429),
        spawn2 = vector3(778.497, -248.3626, 66.11424),
        claim = vector3(-757.9948, -45.33128, 37.87983),
    },
    windfarm = {
        spawn1 = vector3(197.5216, 2848.141, 44.53611),
        spawn2 = vector3(1691.623, -1844.877, 109.2438),
        claim = vector3(2263.823, 2039.317, 129.0077),
    },
    paleto = {
        spawn1 = vec3(-984.515564, 5383.366699, 40.825981),
        spawn2 = vec3(1442.719482, 6497.219238, 20.127312),
        claim = vec3(-237.020432, 6296.937988, 31.501144)
    }
}