
GLOBAL_LIST_EMPTY(playervaults)	//This should be a list of datum references. It should be populated from the database the first time a vault terminal is initialized each round.
GLOBAL_PROTECT(playervaults)
GLOBAL_VAR(vaultdbloaded) //This var is set to true after the first load from database.

/datum/playervault
	var/ckey = ""
	var/currency = 0
	var/list/storeditems = list()

/datum/playervault/New(init_ckey, init_currency, init_storeditems)//This should be called while loading vault entries from the database, or whenever a new player accesses the vault terminal for the first time, which adds them to the database.
	ckey = init_ckey//TODO: Explore possibility for mailing system so that players can trade items across play sessions.
	currency = init_currency
	storeditems = init_storeditems

/proc/load_vaults()
	var/backup_file = file2text("modular_persistance/data/vaults_backup.json")
	if(backup_file == null)
		log_world("Unable to locate vaults backup file.")
		return FALSE
	var/list/json = json_decode(backup_file)
	for(var/J in json["vaults"])
		var/skip
		for(var/datum/playervault/PV in GLOB.playervaults)
			if(PV.ckey == "[J]") //this vault was already loaded
				skip = TRUE
		if(skip)
			continue
		var/ckey = json["vaults"]["[J]"]["ckey"]
		var/currency = json["vaults"]["[J]"]["currency"]
		var/list/items = json["vaults"]["[J]"]["storeditems"]
		var/list/storeditems = list()
		for(var/path as anything in items)
			storeditems[text2path(path)] = items[path]
		var/datum/playervault/PV = new(ckey, currency, list())
		PV.storeditems += storeditems
		if(!PV)
			continue
		GLOB.playervaults += list(PV.ckey = PV)
	return
/*
/proc/sync_vaults_with_db()
	set waitfor = FALSE
	var/list/vaultdata = list()
	for(var/datum/playervault/PV in GLOB.playervaults)
		vaultdata += list(list("ckey" = PV.ckey, "currency" = PV.currency, "storeditems" = json_encode(PV.storeditems)))
	SSdbcore.MassInsert(format_table_name("vault"), vaultdata, duplicate_key = TRUE)
*/
/datum/controller/subsystem/ticker/proc/save_vault_data()
//	if(GLOB.vaultdbloaded == TRUE)
//		sync_vaults_with_db()
	var/json_file = file("modular_persistance/data/vaults_backup.json")
	var/list/file_data = list("vaults" = list())
	for(var/datum/ckey as anything in GLOB.playervaults)
		var/datum/playervault/PV = GLOB.playervaults[ckey]
		file_data["vaults"]["[PV.ckey]"] = list()
		file_data["vaults"]["[PV.ckey]"]["ckey"] = PV.ckey
		file_data["vaults"]["[PV.ckey]"]["currency"] = PV.currency
		file_data["vaults"]["[PV.ckey]"]["storeditems"] = PV.storeditems
	fdel(json_file)
	WRITE_FILE(json_file, json_encode(file_data))
