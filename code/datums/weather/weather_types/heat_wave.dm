/datum/weather/heat_wave
	name = "heat wave"
	desc = "Harsh heat wave will grip an entire area."
	probability = 0

	telegraph_message = span_notice("The temperature outside starts to rise unfavorably.")
	telegraph_duration = 300
	telegraph_overlay = "light_ash"
	telegraph_sound = 'sound/f13effects/heatwave.ogg'
	weather_sound = 'sound/f13effects/heatwave.ogg'

	weather_message = span_notice("Without much warning, the outside air grows hazy as an especially intense desert heat sets in. You feel as though you are better off indoors.")
	weather_overlay = "light_ash"
	weather_duration_lower = 1200
	weather_duration_upper = 2400

	end_duration = 100
	end_message = span_notice("The heat outside seems to wane to a more bearable degree. You feel as though the outdoors may be viable once more.")

	tag_weather = WEATHER_HEAT
	area_types = list(/area/frontier/outdoor, 
/area/frontier/outdoor/wilderness, 
/area/frontier/outdoor/river, 
/area/frontier/outdoor/shoreline, 
/area/frontier/outdoor/colony, 
/area/frontier/outdoor/colony/depot_dock,
/area/frontier/outdoor/colony/roof,
/area/frontier/outdoor/eastwater_town,
/area/frontier/outdoor/wilderness_north
)
	protected_areas = list(/area/shuttle)
	target_trait = ZTRAIT_STATION

	immunity_type = "lava"

	barometer_predictable = TRUE

	carbons_only = TRUE

/datum/weather/heat_wave/weather_act(mob/living/L)
	L.adjust_bodytemperature(rand(10, 20))
