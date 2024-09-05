config = {}

config.directions = {
    [0] = 'North',
    [1] = 'North-West', 
    [2] = 'West',
    [3] = 'South-West',
    [4] = 'South',
    [5] = 'South-East',
    [6] = 'East',
    [7] = 'North-East',
    [8] = 'North'
}

config.zones = {
	['AIRP'] = "Los Santos International Airport", 
	['ALAMO'] = "Alamo Sea", 
	['ALTA'] = "Alta", 
	['ARMYB'] = "Fort Zancudo", 
	['BANHAMC'] = "Banham Canyon Dr", 
	['BANNING'] = "Banning", 
	['BEACH'] = "Vespucci Beach", 
	['BHAMCA'] = "Banham Canyon", 
	['BRADP'] = "Braddock Pass", 
	['BRADT'] = "Braddock Tunnel", 
	['BURTON'] = "Burton", 
	['CALAFB'] = "Calafia Bridge", 
	['CANNY'] = "Raton Canyon", 
	['CCREAK'] = "Cassidy Creek", 
	['CHAMH'] = "Chamberlain Hills", 
	['CHIL'] = "Vinewood Hills", 
	['CHU'] = "Chumash", 
	['CMSW'] = "Chiliad Mountain State Wilderness", 
	['CYPRE'] = "Cypress Flats", 
	['DAVIS'] = "Davis", 
	['DELBE'] = "Del Perro Beach", 
	['DELPE'] = "Del Perro", 
	['DELSOL'] = "La Puerta", 
	['DESRT'] = "Grand Senora Desert", 
	['DOWNT'] = "Downtown", 
	['DTVINE'] = "Downtown Vinewood", 
	['EAST_V'] = "East Vinewood", 
	['EBURO'] = "El Burro Heights", 
	['ELGORL'] = "El Gordo Lighthouse", 
	['ELYSIAN'] = "Elysian Island", 
	['GALFISH'] = "Galilee", 
	['GOLF'] = "GWC and Golfing Society", 
	['GRAPES'] = "Grapeseed", 
	['GREATC'] = "Great Chaparral", 
	['HARMO'] = "Harmony", 
	['HAWICK'] = "Hawick", 
	['HORS'] = "Vinewood Racetrack", 
	['HUMLAB'] = "Humane Labs and Research", 
	['JAIL'] = "Bolingbroke Penitentiary", 
	['KOREAT'] = "Little Seoul", 
	['LACT'] = "Land Act Reservoir", 
	['LAGO'] = "Lago Zancudo", 
	['LDAM'] = "Land Act Dam", 
	['LEGSQU'] = "Legion Square", 
	['LMESA'] = "La Mesa", 
	['LOSPUER'] = "La Puerta", 
	['MIRR'] = "Mirror Park", 
	['MORN'] = "Morningwood", 
	['MOVIE'] = "Richards Majestic", 
	['MTCHIL'] = "Mount Chiliad", 
	['MTGORDO'] = "Mount Gordo", 
	['MTJOSE'] = "Mount Josiah", 
	['MURRI'] = "Murrieta Heights", 
	['NCHU'] = "North Chumash", 
	['NOOSE'] = "N.O.O.S.E", 
	['OCEANA'] = "Pacific Ocean", 
	['PALCOV'] = "Paleto Cove", 
	['PALETO'] = "Paleto Bay", 
	['PALFOR'] = "Paleto Forest", 
	['PALHIGH'] = "Palomino Highlands", 
	['PALMPOW'] = "Palmer-Taylor Power Station", 
	['PBLUFF'] = "Pacific Bluffs", 
	['PBOX'] = "Pillbox Hill", 
	['PROCOB'] = "Procopio Beach", 
	['RANCHO'] = "Rancho", 
	['RGLEN'] = "Richman Glen", 
	['RICHM'] = "Richman", 
	['ROCKF'] = "Rockford Hills", 
	['RTRAK'] = "Redwood Lights Track", 
	['SANAND'] = "San Andreas", 
	['SANCHIA'] = "San Chianski Mountain Range", 
	['SANDY'] = "Sandy Shores", 
	['SKID'] = "Mission Row", 
	['SLAB'] = "Stab City", 
	['STAD'] = "Maze Bank Arena", 
	['STRAW'] = "Strawberry", 
	['TATAMO'] = "Tataviam Mountains", 
	['TERMINA'] = "Terminal", 
	['TEXTI'] = "Textile City", 
	['TONGVAH'] = "Tongva Hills", 
	['TONGVAV'] = "Tongva Valley", 
	['VCANA'] = "Vespucci Canals", 
	['VESP'] = "Vespucci", 
	['VINE'] = "Vinewood", 
	['WINDF'] = "Ron Alternates Wind Farm", 
	['WVINE'] = "West Vinewood", 
	['ZANCUDO'] = "Zancudo River", 
	['ZP_ORT'] = "Port of South Los Santos", 
	['ZQ_UAR'] = "Davis Quartz"
}

config.setDefaultHud = function()
    local default = {}
    default.health = 0
	default.armour = 0
	
    default.voice = {}
    default.voice.level = 0
	default.voice.active = false
	
	default.location = {}
	default.location.aop = ""
	default.location.data_1 = ""
	default.location.data_2 = ""
	default.location.direction = 0
	
	default.vehicle = {}
	default.vehicle.type = "car" -- air
    default.vehicle.fuel = 0
    default.vehicle.speed = 0
    default.vehicle.seatbelt = false
	default.vehicle.inVehicle = false
	
    return default
end

config.setDefaultNotification = function()
	local default = {}
	default.id = "notification"
	default.title = nil
	
	default.type = {}
	default.type.key = nil
	default.type.priority = nil
	default.type.job = nil
	default.type.default = true

	default.data = {}
	default.data.callsign = nil
	default.data.code = nil
	default.data.direction = nil
	default.data.location = nil
	default.data.messageIcon = nil
	default.data.message = nil

	default.options = {}
	default.options.timeout = 1000
	default.options.position = "bottom-right"

	default.overrides = {}
	default.overrides.headerBackground = nil
	default.overrides.headerTextColor = nil
	default.overrides.bodyBackground = nil
	default.overrides.bodyTextColor = nil

	return default
end