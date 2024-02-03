state("AI", "Steam") 	// Script Written by Spaz (Any Issues, Please place a query on #Support in the Alien: Isolation Discord)
{
	int fadeState : 0x15D24B4;
	float fadeNum : 0x15D24B8;
	byte gameFlowState : 0x12F0C88, 0x48, 0x8;
	int levelManagerState : 0x12F0C88, 0x3C, 0x4C;
	int missionNum : 0x17E4814, 0x4, 0x4E8;
	string25 Map : 0x17E4814, 0x4, 0x470;
    float PosX : 0x123623C, 0x14, 0x374, 0x4, 0x70;
    float PosY : 0x123623C, 0x14, 0x374, 0x4, 0x74;
    float PosZ : 0x123623C, 0x14, 0x374, 0x4, 0x78;
}
state("AI", "Epic Games")
{
	int fadeState : 0x15E2664;
	float fadeNum : 0x15E2668;
	byte gameFlowState : 0x12526BC, 0x8;
	int levelManagerState : 0x1BDD628, 0x54;
	int missionNum : 0x130D1A8, 0x78, 0x10EC;
	string25 Map : 0x17F49B4, 0x4, 0x446;
    float PosX : 0x3FF598, 0x80;
	float PosY : 0x3FF598, 0x84;
    float PosZ : 0x3FF598, 0x88;
    
}
state("AI", "Xbox Game Pass") 
{
	int fadeState : 0x01D7B2D8;
	float fadeNum : 0x0197FE98, 0xB40, 0xFD4;
	byte gameFlowState : 0x17EEBD0, 0x8;
	int levelManagerState : 0x01915A88, 0x78, 0x90;
    int missionNum : 0x19759D0, 0x280;
	string25 Map : 0x0198EA88, 0x1A0;
    float PosX : 0x01918418, 0xC0;
    float PosY : 0x01918418, 0xC4;
	float PosZ : 0x01918418, 0xC8;
}
startup
{	
    vars.loading = false;
	vars.final = false;
	vars.mission = null;
	vars.SavedMap = null;
	vars.repeatstopper = null;
	vars.fadetrigger = null;
#region Splitter Settings
	settings.Add("campaign", true, "Campaign");
		settings.Add("allmissions", true, "All Missions", "campaign");
			settings.Add("amsubsplit", false, "SubSplits", "allmissions");
			settings.Add("loadSubsplit", false, "Split on Load Screens", "amsubsplit");
			settings.Add("ManualSubsplit", false, "Additional Subsplits", "amsubsplit");
				settings.Add("m2Elevator", false, "M2 Elevator", "ManualSubsplit");
				settings.Add("m4ElevatorUp", false, "M4 Elevator Up", "ManualSubsplit");
				settings.Add("m4ElevatorDwn", false, "M4 Elevator Down", "ManualSubsplit");
				settings.Add("m6ColdStorage", false, "M6 Vent Drop", "ManualSubsplit");
				settings.Add("m7Elevator", false, "M7 Elevator", "ManualSubsplit");
				settings.Add("m8Elevator", false, "M8 Elevator", "ManualSubsplit");
				settings.Add("m9Splits", false, "M9 Splits", "ManualSubsplit");
					settings.Add("m9Heyst_1", false, "M9 Heyst First Boost", "m9Splits");
					settings.Add("m9Heyst_2", false, "M9 Heyst Second Boost", "m9Splits");
					settings.Add("m9Meeks", false, "M9 Meeks Boost", "m9Splits");
				settings.Add("m12Vent", false, "M12 Vent", "ManualSubsplit");
				settings.Add("m12ElevatorDwn", false, "M12 Elevator Up", "ManualSubsplit");
				settings.Add("m12ElevatorUp", false, "M12 Keycard Insert", "ManualSubsplit");
				settings.Add("m13VentDrop", false, "M13 Vent Drop", "ManualSubsplit");
				settings.Add("m14VentDrop", false, "M14 Vent Drop", "ManualSubsplit");
				settings.Add("m16ElevatorUp", false, "M16 Elevator Up", "ManualSubsplit");
				settings.Add("m16ElevatorDwn", false, "M16 Elevator Down", "ManualSubsplit");
				settings.Add("m17TransitElevator", false, "M17 Transit Elevator", "ManualSubsplit");
				settings.Add("m18VentGrab", false, "M18 Vent Grab", "ManualSubsplit");
				settings.Add("m18SpaceWalk", false, "M18 Space Walk", "ManualSubsplit");
		settings.Add("any", false, "Any% CC Only", "campaign");
			settings.Add("anyX3", false, "M18 Subsplits", "any");
		settings.Add("anyFPS", false, "Any% CC+FPS", "campaign");
	settings.Add("dlc", false, "DLC");
		settings.Add("expendable", false, "Crew Expendable", "dlc");
		settings.Add("lastsurvivor", false, "Last Survivor", "dlc");
	settings.Add("ils", false, "ILs");
		settings.Add("ilsSub", false, "IL Subsplit", "ils");
			settings.Add("ILloadSubsplit", false, "Split on Load Screens?", "ilsSub");
			settings.Add("ILManualSubsplit", false, "Additional Subsplits", "ilsSub");
				settings.Add("ILm2Elevator", false, "M2 Elevator", "ILManualSubsplit");
				settings.Add("ILm4ElevatorUp", false, "M4 Elevator Up", "ILManualSubsplit");
				settings.Add("ILm4ElevatorDwn", false, "M4 Elevator Down", "ILManualSubsplit");
				settings.Add("ILm6ColdStorage", false, "M6 Vent Drop", "ILManualSubsplit");
				settings.Add("ILm7Elevator", false, "M7 Vent Drop", "ILManualSubsplit");
				settings.Add("ILm8Elevator", false, "M8 Elevator", "ILManualSubsplit");
				settings.Add("ILm9Splits", false, "M9 Splits", "ILManualSubsplit");
					settings.Add("ILm9Heyst_1", false, "M9 Heyst First Boost", "ILm9Splits");
					settings.Add("ILm9Heyst_2", false, "M9 Heyst Second Boost", "ILm9Splits");
					settings.Add("ILm9Meeks", false, "M9 Meeks Boost", "ILm9Splits");
				settings.Add("ILm12Vent", false, "M12 Vent", "ILManualSubsplit");
				settings.Add("ILm12ElevatorDwn", false, "M12 Elevator Up", "ILManualSubsplit");
				settings.Add("ILm12ElevatorUp", false, "M12 Keycard Insert", "ILManualSubsplit");
				settings.Add("ILm13VentDrop", false, "M13 Vent Drop", "ILManualSubsplit");
				settings.Add("ILm14VentDrop", false, "M14 Vent Drop", "ILManualSubsplit");
				settings.Add("ILm16ElevatorUp", false, "M16 Elevator Up", "ILManualSubsplit");
				settings.Add("ILm16ElevatorDwn", false, "M16 Elevator Down", "ILManualSubsplit");
				settings.Add("ILm17TransitElevator", false, "M17 Transit Elevator", "ILManualSubsplit");
				settings.Add("ILm18VentGrab", false, "M18 Vent Grab", "ILManualSubsplit");
				settings.Add("ILm18SpaceWalk", false, "M18 Space Walk", "ILManualSubsplit");
	settings.Add("CatExt", false, "Category Extensions");
		settings.Add("death", false, "Death%", "CatExt");
		settings.Add("KillCiv", false, "Kill Civilian%", "CatExt");
#endregion
#region ToolTips
	settings.SetToolTip("campaign","If nothing selected below this, All Missions is DEFAULTED.");
        settings.SetToolTip("loadSubsplit","This will cause Splits to happen on Every Load Screen.");
            settings.SetToolTip("m2Elevator","Elevator with Axel");
            settings.SetToolTip("m4ElevatorUp","Elevator transition to Upper Floor");
            settings.SetToolTip("m4ElevatorDwn","Elevator transition to Lower Floor");
            settings.SetToolTip("m6ColdStorage","Vent Drop after Cold Storage");
            settings.SetToolTip("m7Elevator","Elevator after Compression Cylinder is Obtained");
            settings.SetToolTip("m8Elevator","Elevator transision to Transit Control");
            settings.SetToolTip("m12Vent","Vent Entrance before Samuels kills Joe");
            settings.SetToolTip("m12ElevatorUp","Keycard Insert");
            settings.SetToolTip("m12ElevatorDwn","Elevator back to APOLLO Tram");
            settings.SetToolTip("m13VentDrop","Vent Drop into APOLLO Area");
            settings.SetToolTip("m14VentDrop","Vent Drop Under Vehicle Hoist");
            settings.SetToolTip("m16ElevatorUp","Elevator transition to Upper Floor");
            settings.SetToolTip("m16ElevatorDwn","Elevator transition to Lower Floor");
            settings.SetToolTip("m17TransitElevator","Elevator that breakdown");
            settings.SetToolTip("m18VentGrab","Yeetus your Meatus");
            settings.SetToolTip("m18SpaceWalk","Space Suit ''Change'' Prompt");
            settings.SetToolTip("ILManualSubsplit","Click this for Extra Splits within the IL's");
            settings.SetToolTip("ILm2Elevator","Elevator with Axel");
            settings.SetToolTip("ILm4ElevatorUp","Elevator transition to Upper Floor");
            settings.SetToolTip("ILm4ElevatorDwn","Elevator transition to Lower Floor");
            settings.SetToolTip("ILm6ColdStorage","Vent Drop after Cold Storage");
            settings.SetToolTip("ILm7Elevator","Elevator after Compression Cylinder is Obtained");
            settings.SetToolTip("ILm8Elevator","Elevator transision to Transit Control");
            settings.SetToolTip("ILm12Vent","Vent Entrance before Samuels kills Joe");
            settings.SetToolTip("ILm12ElevatorUp","Elevator to Cryo Vents");
            settings.SetToolTip("ILm12ElevatorDwn","Elevator back to APOLLO Tram");
            settings.SetToolTip("ILm13VentDrop","Vent Drop into APOLLO Area");
            settings.SetToolTip("ILm14VentDrop","Vent Drop Under Vehicle Hoist");
            settings.SetToolTip("ILm16ElevatorUp","Elevator transition to Upper Floor");
            settings.SetToolTip("ILm16ElevatorDwn","Elevator transition to Lower Floor");
            settings.SetToolTip("ILm17TransitElevator","Elevator that breakdown");
            settings.SetToolTip("ILm18VentGrab","Yeetus your Meatus");
            settings.SetToolTip("ILm18SpaceWalk","Space Suit ''Change'' Prompt");
	settings.SetToolTip("CatExt","Please select ONLY ONE of the below");	
		settings.SetToolTip("death","Timer Ends when Screen Turns Black");
		settings.SetToolTip("KillCiv","Timer Ends when Screen Turns Black");
#endregion
}
init
{
	if(modules.First().ModuleMemorySize == 0x1F81000){ // Detects Game Version
        version = "Steam";
        } 
	if(modules.First().ModuleMemorySize == 0x1F9F000){
        version = "Epic Games";
        }
	if(modules.First().ModuleMemorySize == 0x2766000){
        version = "Xbox Game Pass";
        }
}
start
{	
	vars.loading = false;
	vars.final = false;
	vars.mission = null; 
	vars.repeatstopper = 0;
	vars.SavedMap = current.Map;
	vars.fadetrigger = current.fadeState == 2 && current.fadeNum > 0 || old.gameFlowState == 6 && current.gameFlowState == 4;
#region Starting Checker
	if((settings["allmissions"] == true && settings["campaign"] == true) && vars.fadetrigger){ // Detects if PLAYER is starting All Missions
		vars.SavedMap = current.Map;
		vars.repeatstopper = 0;
		return true;
    }
	else if(settings["any"] == true && vars.fadetrigger){ // Detects if PLAYER is starting Any% 
		vars.SavedMap = current.Map;
		vars.repeatstopper = 0;
		return true;
    }
	else if(settings["anyFPS"] == true && vars.fadetrigger){return true;} // Detects if PLAYER is on Any% CC+FPS, sets the splits to be on Map Change
	if(settings["dlc"] == true && current.fadeState == 2 && current.PosX != 0){ // Detects if PLAYER is on DLC Maps and Starts Timer when player spawns into the world
		if(current.Map == "PRESENCE_NOSTROMO_RIPLEY" || current.Map == "PRESENCE_NOSTROMO_TWO_TEA"){
			vars.SavedMap = current.Map;
			return true;}
	}
	if(settings["ils"] == true && vars.fadetrigger){
		vars.repeatstopper = 0;
		return true;
    }
#endregion
} 
update
{	
#region Subsplit variables - Variables are only Visible if the ["Setting"] is Checked
    if(settings["loadSubsplit"] || settings["ILloadSubsplit"]){
        vars.m2Elevator = current.PosX > 22.85 && current.PosX < 26.11 && current.PosZ > -108 && current.PosZ < -104.5 && current.PosY < 5;							        // Elevator with Axel
        vars.m4ElevatorUp = current.PosZ < 14.5 && current.PosZ > 10.8 && current.PosX > -7.4 && current.PosX < -4.15 && current.PosY > 24; 						    	// This is also used for M16 Elevator
        vars.m4ElevatorDwn = current.PosZ < 15.5 && current.PosZ > 11.5 && current.PosX > -7.4 && current.PosX < -4.15 && current.PosY < 13 && current.PosY > 12; 	// This is also used for M16 Elevator
        vars.m6ColdStorage = current.PosY > 1 && current.PosY < 2 && current.PosZ > -23 && current.PosZ < -20 && current.PosX > -10 && current.PosX < -8; 			// Vent Drop after Cold Storage
        vars.m7Elevator = current.PosZ > 58.5 && current.PosZ < 58.7 && current.PosX > -22.55 && current.PosX < -22.4 && current.PosY > -15 && current.PosY < -14.9; 	// Elevator after Spice Section
        vars.m8Elevator = current.PosX > 31.2 && current.PosX < 33.2 && current.PosZ > 68.5 && current.PosZ < 71 && current.PosY > 9 && current.PosY < 10;			// Elevator after pressing Button to Trasit Control
        vars.m9Heyst_1 = current.PosX > 48.7 && current.PosX < 48.75 && current.PosZ > 0.7 && current.PosZ < 0.74 && current.PosY > -18.1 && current.PosY < -18;		// M9 First Heyst Leg-Up
        vars.m9Heyst_2 = current.PosX > 74.18 && current.PosX < 74.20 && current.PosZ > 21.3 && current.PosZ < 21.4 && current.PosY > -15.25 && current.PosY < -15.2;	// M9 Second Heyst Leg-Up
        vars.m9Derelict = current.PosX >= -112 && current.PosX <= -111.5 && current.PosZ < 122 && current.PosZ > 121;											                // M9 Transition to Derelict
        vars.m9Meeks = current.PosX > -45.4 && current.PosX < -45.3 && current.PosZ > -13.3 && current.PosZ < -13.25 && current.PosY > 1.45 && current.PosY < 1.5;	// M9 Meeks Leg-Up
        vars.m12vent = current.PosX > -48.5 && current.PosX < -47 && current.PosZ > 38.5 && current.PosZ < 39 && current.PosY > 19.7; 								        // Vent Entrance before seeing Samuels ruin Joe
        vars.m12ElevatorUp = current.PosZ > 25.4 && current.PosZ < 25.5 && current.PosX > -31.1 && current.PosX < -31 && current.PosY > 17.82 && current.PosY < 17.83;		// Keycard Door
        vars.m12ElevatorDwn = current.PosZ > 46.3 && current.PosZ < 50.1 && current.PosX > -21 && current.PosX < -17 && current.PosY > 4 && current.PosY < 4.2;		// Elevator From Cryo Vents
        vars.m13ventDrop = current.PosZ > -2.6 && current.PosZ < -1.1 && current.PosX > -17.5 && current.PosX < -15 && current.PosY > 0.8 && current.PosY < 1.2;		// Vent Drop inside APOLLO Area
        vars.m14ventDrop = current.PosZ > -44 && current.PosZ < -42 && current.PosX > -24 && current.PosX < -21 && current.PosY > 16.3 && current.PosY < 16.8;		// Vent Drop under Hoist
        vars.m17TransitElevator = current.PosX > 52.4 && current.PosX < 52.55 && current.PosZ > 5.84 && current.PosZ < 5.86;									                	// Elevator button that crashes
        vars.m18VentGrab = current.PosX >= -105 && current.PosX <= -103 && current.PosZ >= 93 && current.PosZ <= 96;												                // YOINK
        vars.m18SpaceWalk = current.PosX >= 21.4 && current.PosX <= 22 && current.PosY >= -20.8 && current.PosY <= -20.6 && current.PosZ >= -1 && current.PosZ <= 0;	// Button Press on Space Suit
    }
	if((settings["m9Heyst_1"] == false || settings["ILm9Heyst_1"] == false) && current.missionNum == 9 && vars.m9Heyst_1){vars.repeatstopper = 1;}	// M9 Heyst first Leg-up
    if((settings["m9Heyst_2"] == false || settings["ILm9Heyst_2"] == false) && current.missionNum == 9 && vars.m9Heyst_2){vars.repeatstopper = 2;}	// M9 Heyst Second Leg-up
    if((settings["m9Meeks"] == false || settings["ILm9Meeks"] == false) && current.missionNum == 9 && vars.m9Meeks){vars.repeatstopper = 4;}		// M9 Meks Leg-up
	if(settings["any"]){
		vars.m18VentGrab = current.PosX >= -105 && current.PosX <= -103 && current.PosZ >= 93 && current.PosZ <= 96;												                // YOINK
        vars.m18SpaceWalk = current.PosX >= 21.4 && current.PosX <= 22 && current.PosY >= -20.8 && current.PosY <= -20.6 && current.PosZ >= -1 && current.PosZ <= 0;	// Button Press on Space Suit
	}
#endregion
	if(old.levelManagerState == 5 && current.levelManagerState == 7 || current.gameFlowState == 6){vars.loading = true;}
	else if(current.fadeState == 2 && old.fadeNum < 0.2 && current.fadeNum > 0.2){	vars.loading = false;} 									// Check if on Loading Screen
	if(current.missionNum == 19 && current.fadeState == 2 && old.fadeNum < 0.5 && current.fadeNum > 0.5){vars.final = true;} 				// Checks if on final mission
	if(vars.mission == null && current.fadeState == 2 && old.fadeNum < 0.5 && current.fadeNum > 0.5){vars.mission = current.missionNum;} 	// Updates vars.mission with the current mission on game start
}
split
{
#region Splits
// Splits for DLC Maps
	if(settings["dlc"] == true && current.Map != vars.SavedMap){return true;}
// Splits for Any% CC+FPS
	if(settings["anyFPS"] == true){
		if(vars.mission != null && current.Map != vars.SavedMap){
		vars.SavedMap = current.Map;
		return true;}
	else if(vars.final == true && current.fadeState == 1 && current.gameFlowState == 4){
		vars.final = false;
		return true;}
	}
// Splits for Any%
	if (settings["any"] == true){
		if(current.Map != vars.SavedMap){	// Splits if Map Name changes
			vars.SavedMap = current.Map;	// Updates Map Name
			return true;}
			if (settings["anyX3"] == true){
			if(current.missionNum == 3 && vars.m18VentGrab && vars.repeatstopper == 0){
				vars.repeatstopper = 1;
				return true;}
			if(current.missionNum == 3 && vars.m18SpaceWalk &&  vars.repeatstopper == 1){
				vars.repeatstopper = 2;
				return true;}
			}
		if(vars.final == true && current.fadeState == 1 && current.gameFlowState == 4){return true;}
	}
// Splits for All Missions
	if(settings["allmissions"] == true && settings["loadSubsplit"]  == false || settings["ils"] == true && settings["ILloadSubsplit"] == false){
		if(vars.mission != null && current.missionNum > vars.mission){vars.mission = current.missionNum;
			return true;}
		else if(vars.final == true && current.fadeState == 1 && current.gameFlowState == 4){vars.final = false;
			return true;}
	}
// Split for Each Load Screen
	if(settings["allmissions"] == true && settings["loadSubsplit"] == true || settings["ilsSub"] == true && settings["ILloadSubsplit"] == true){
		if(vars.final == true && current.fadeState == 1 && current.gameFlowState == 4){vars.final = false; // Splits timer for Fade out on M19
			return true;}
		if(current.missionNum == 9 && vars.m9Derelict && vars.repeatstopper == 2 ){ 						// M9 Derelict Transition
			vars.repeatstopper = 3;
			return true;}
		else if(vars.SavedMap != current.Map || current.missionNum > vars.mission){ 						// On Map Change
			vars.repeatstopper = 0;
			vars.mission = current.missionNum;
			vars.SavedMap = current.Map;
			return true;}
	}
// Additional Splits (Subsplits included in IL's)
	if(settings["m2Elevator"] == true || settings["ILm2Elevator"] == true){
		if(current.missionNum == 2 && vars.m2Elevator && vars.repeatstopper == 0){ 				// M2 Elevator Split
			vars.repeatstopper = 1;
			return true;}}
	if(settings["m4ElevatorUp"] == true || settings["ILm4ElevatorUp"] == true){		
		if(current.missionNum == 4 && vars.m4ElevatorUp && vars.repeatstopper == 0){ 			// M4 Elevator Up
			vars.repeatstopper = 1;
			return true;}}
	if(settings["m4ElevatorDwn"] == true || settings["ILm4ElevatorDwn"] == true){	
		if(current.missionNum == 4 && vars.m4ElevatorDwn && vars.repeatstopper == 1){ 			// M4 Elevator Dwn
			vars.repeatstopper = 2;
			return true;}}
	if(settings["m6ColdStorage"] == true || settings["ILm6ColdStorage"] == true){		
		if(current.missionNum == 6 && vars.m6ColdStorage && vars.repeatstopper == 0){ 			// M6 Vent Drop
			vars.repeatstopper = 1;
			return true;}}
	if(settings["m7Elevator"] == true || settings["ILm7Elevator"] == true){
		if(current.missionNum == 7 && vars.m7Elevator && vars.repeatstopper == 0){ 				// M7 Vent Drop
			vars.repeatstopper = 1;
			return true;}}
	if(settings["m8Elevator"] == true || settings["ILm8Elevator"] == true){
		if(current.missionNum == 8 && vars.m8Elevator && vars.repeatstopper == 0){ 				// M8 Elevator
			vars.repeatstopper = 1;
			return true;}}
	if(settings["m9Heyst_1"] == true || settings["ILm9Heyst_1"] == true){	
		if(current.missionNum == 9 && vars.m9Heyst_1 && vars.repeatstopper == 0){ 				// M9 Heyst first Leg-up
			vars.repeatstopper = 1;
			return true;}}
	if(settings["m9Heyst_2"] == true || settings["ILm9Heyst_2"] == true){	
		if(current.missionNum == 9 && vars.m9Heyst_2 && vars.repeatstopper == 1){ 				// M9 Heyst second Leg-up
			vars.repeatstopper = 2;
			return true;}}
	if(settings["m9Meeks"] == true || settings["ILm9Meeks"] == true){	
		if(current.missionNum == 9 && vars.m9Meeks && vars.repeatstopper == 3){ 				// M9 Meeks Leg-Up
			vars.repeatstopper = 4;
			return true;}}
	if(settings["m12Vent"] == true || settings["ILm12Vent"] == true){
		if(current.missionNum == 12 && vars.m12vent && vars.repeatstopper == 0){ 				// M12 Vent
			vars.repeatstopper = 1;
			return true;}}
	if(settings["m12ElevatorDwn"] == true || settings["ILm12ElevatorDwn"] == true){
		if(current.missionNum == 12 && vars.m12ElevatorDwn && vars.repeatstopper == 1){ 		// M12 Elevator Down
			vars.repeatstopper = 2;
			return true;}}
	if(settings["m12ElevatorUp"] == true || settings["ILm12ElevatorUp"] == true){
		if(current.missionNum == 12 && vars.m12ElevatorUp && vars.repeatstopper == 2){ 			// M12 Elevator Up
			vars.repeatstopper = 3;
			return true;}}
	if(settings["m13VentDrop"] == true || settings["ILm13VentDrop"] == true){
		if(current.missionNum == 13 && vars.m13ventDrop && vars.repeatstopper == 0){			// M13 Vent Drop
			vars.repeatstopper = 1;
			return true;}}
	if(settings["m14VentDrop"] == true || settings["ILm14VentDrop"] == true){
		if(current.missionNum == 14 && vars.m14ventDrop && vars.repeatstopper == 0){ 			// M14 Vent Drop
			vars.repeatstopper = 1;
			return true;}}
	if(settings["m16ElevatorUp"] == true || settings["ILm16ElevatorUp"] == true){
		if(current.missionNum == 16 && vars.m4ElevatorUp && vars.repeatstopper == 0){ 			// M16 Elevator Up
			vars.repeatstopper = 1;
			return true;}}
	if(settings["m16ElevatorDwn"] == true || settings["ILm16ElevatorDwn"] == true){
		if(current.missionNum == 16  && vars.m4ElevatorDwn && vars.repeatstopper == 1){ 		// M16 Elevator Dwn
			vars.repeatstopper = 2;
			return true;}}
	if(settings["m17TransitElevator"] == true || settings["ILm17TransitElevator"] == true){
		if(current.missionNum == 17  && vars.m17TransitElevator && vars.repeatstopper == 0){ 	// M17 Transit Elevator
			vars.repeatstopper = 1;
			return true;}}
	if(settings["m18VentGrab"] == true || settings["ILm18VentGrab"] == true){
		if(current.missionNum == 18  && vars.m18VentGrab && vars.repeatstopper == 0){ 			// M18 Alien Vent Grab
			vars.repeatstopper = 1;
			return true;}}
	if(settings["m18SpaceWalk"] == true || settings["ILm18SpaceWalk"] == true){
		if(current.missionNum == 18  && vars.m18SpaceWalk && vars.repeatstopper == 1){ 			// M18 Space Walk Prompt
			vars.repeatstopper = 2;
			return true;}}
// Category Extensions
	if(settings["CatExt"] == true && current.gameFlowState == 5){return true;}
#endregion
}
isLoading{return vars.loading;}