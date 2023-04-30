

state("AI", "Steam")
{
	int fadeState : 0x15D24B4;
	float fadeNum : 0x15D24B8;
	byte gameFlowState : 0x12F0C88, 0x48, 0x8;
	int levelManagerState : 0x12F0C88, 0x3C, 0x4C;
	byte loadingIcon : 0x134A7D0, 0x1D;
	int missionNum : 0x17E4814, 0x4, 0x4E8;
	string25 Map : 0x017E4814, 0x4, 0x470;
	float pX : 0x123623C, 0x14, 0x374, 0x4, 0x70;
	float pY : 0x123623C, 0x14, 0x374, 0x4, 0x74;
	float pZ : 0x123623C, 0x14, 0x374, 0x4, 0x78;
	byte Save_Icon : 0x134A7D0, 0x15;
}

state("AI", "Epic")
{
	int fadeState : 0x15E2664;
	float fadeNum : 0x15E2668;
	byte gameFlowState : 0x012526BC, 0x8;
	int levelManagerState : 0x0130D30C, 0x68, 0x4C;
	int missionNum : 0x130D1A8, 0x78, 0x10EC;
	byte loadingIcon : 0x01366CAC, 0xF50, 0x1D;
	string25 Map : 0x017F49B4, 0x4, 0x446;
	string25 Main_Menu : 0x017F49B4, 0x4, 0x430;
	float Xaxis : 0x3FF598, 0x80;
	float Yaxis : 0x3FF598, 0x84;
	float Zaxis : 0x3FF598, 0x88; 
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
	settings.SetToolTip("campaign","If nothing selected below this, All Missions is DEFAULTED.");
		settings.Add("allmissions", true, "All Missions", "campaign");
			settings.Add("amsubsplit", false, "SubSplits", "allmissions");
			settings.Add("tramtimer", false, "Tram Timer?", "amsubsplit");
            	settings.SetToolTip("tramtimer","DEV TOOL!!! This times from button press until Load Screen");
			settings.Add("yesSubsplit", false, "Split on Load Screens", "amsubsplit");
			settings.Add("ManualSubsplit", false, "Additional Subsplits", "amsubsplit");
				settings.Add("m2Elevator", false, "M2 Elevator", "ManualSubsplit");
                	settings.SetToolTip("m2Elevator","Elevator with Axel");
				settings.Add("m4ElevatorUp", false, "M4 Elevator Up", "ManualSubsplit");
					settings.SetToolTip("m4ElevatorUp","Elevator transition to Upper Floor");
				settings.Add("m4ElevatorDwn", false, "M4 Elevator Down", "ManualSubsplit");
					settings.SetToolTip("m4ElevatorDwn","Elevator transition to Lower Floor");
				settings.Add("m6ColdStorage", false, "M6 Vent Drop", "ManualSubsplit");
					settings.SetToolTip("m6ColdStorage","Vent Drop after Cold Storage");
				settings.Add("m7Elevator", false, "M7 Elevator", "ManualSubsplit");
					settings.SetToolTip("m7Elevator","Elevator after Compression Cylinder is Obtained");
				settings.Add("m8Elevator", false, "M8 Elevator", "ManualSubsplit");
					settings.SetToolTip("m8Elevator","Elevator transision to Transit Control");				
				settings.Add("m12Vent", false, "M12 Vent", "ManualSubsplit");
					settings.SetToolTip("m12Vent","Vent Entrance before Samuels kills Joe");		
				settings.Add("m12ElevatorUp", false, "M12 Elevator Up", "ManualSubsplit");
					settings.SetToolTip("m12ElevatorUp","Elevator to Cryo Vents");
				settings.Add("m12ElevatorDwn", false, "M12 Elevator Down", "ManualSubsplit");
					settings.SetToolTip("m12ElevatorDwn","Elevator back to APOLLO Tram");
				settings.Add("m13VentDrop", false, "M13 Vent Drop", "ManualSubsplit");
					settings.SetToolTip("m13VentDrop","Vent Drop into APOLLO Area");
				settings.Add("m14VentDrop", false, "M14 Vent Drop", "ManualSubsplit");
					settings.SetToolTip("m14VentDrop","Vent Drop Under Vehicle Hoist");
				settings.Add("m16ElevatorUp", false, "M16 Elevator Up", "ManualSubsplit");
					settings.SetToolTip("m16ElevatorUp","Elevator transition to Upper Floor");
				settings.Add("m16ElevatorDwn", false, "M16 Elevator Down", "ManualSubsplit");
					settings.SetToolTip("m16ElevatorDwn","Elevator transition to Lower Floor");
				settings.Add("m17TransitElevator", false, "M17 Transit Elevator", "ManualSubsplit");
					settings.SetToolTip("m17TransitElevator","Elevator that breakdown");
				settings.Add("m18VentGrab", false, "M18 Vent Grab", "ManualSubsplit");
					settings.SetToolTip("m18VentGrab","Yeetus your Meatus");
				settings.Add("m18SpaceWalk", false, "M18 Space Walk", "ManualSubsplit");
					settings.SetToolTip("m18SpaceWalk","Space Suit ''Change'' Prompt");
		settings.Add("any", false, "Any% CC Only", "campaign");
		settings.Add("anyFPS", false, "Any% CC+FPS", "campaign");
	settings.Add("dlc", false, "DLC");
		settings.Add("expendable", false, "Crew Expendable", "dlc");
		settings.Add("lastsurvivor", false, "Last Survivor", "dlc");
	settings.Add("ils", false, "ILs");
		settings.Add("ilsSub", false, "IL Subsplit", "ils");
			settings.Add("ILyesSubsplit", false, "Split on Load Screens?", "ilsSub");
			settings.Add("ILManualSubsplit", false, "Additional Subsplits", "ilsSub");
				settings.Add("ILm2Elevator", false, "M2 Elevator", "ILManualSubsplit");
					settings.SetToolTip("ILm2Elevator","Elevator with Axel");
				settings.Add("ILm4ElevatorUp", false, "M4 Elevator Up", "ILManualSubsplit");
					settings.SetToolTip("ILm4ElevatorUp","Elevator transition to Upper Floor");
				settings.Add("ILm4ElevatorDwn", false, "M4 Elevator Down", "ILManualSubsplit");
					settings.SetToolTip("ILm4ElevatorDwn","Elevator transition to Lower Floor");
				settings.Add("ILm6ColdStorage", false, "M6 Vent Drop", "ILManualSubsplit");
					settings.SetToolTip("ILm6ColdStorage","Vent Drop after Cold Storage");
				settings.Add("ILm7Elevator", false, "M7 Vent Drop", "ILManualSubsplit");
					settings.SetToolTip("ILm7Elevator","Elevator after Compression Cylinder is Obtained");
				settings.Add("ILm8Elevator", false, "M8 Elevator", "ILManualSubsplit");
					settings.SetToolTip("ILm8Elevator","Elevator transision to Transit Control");
				settings.Add("ILm12Vent", false, "M12 Vent", "ILManualSubsplit");
					settings.SetToolTip("ILm12Vent","Vent Entrance before Samuels kills Joe");
				settings.Add("ILm12ElevatorUp", false, "M12 Elevator Up", "ILManualSubsplit");
					settings.SetToolTip("ILm12ElevatorUp","Elevator to Cryo Vents");
				settings.Add("ILm12ElevatorDwn", false, "M12 Elevator Down", "ILManualSubsplit");
					settings.SetToolTip("ILm12ElevatorDwn","Elevator back to APOLLO Tram");
				settings.Add("ILm13VentDrop", false, "M13 Vent Drop", "ILManualSubsplit");
					settings.SetToolTip("ILm13VentDrop","Vent Drop into APOLLO Area");
				settings.Add("ILm14VentDrop", false, "M14 Vent Drop", "ILManualSubsplit");
					settings.SetToolTip("ILm14VentDrop","Vent Drop Under Vehicle Hoist");
				settings.Add("ILm16ElevatorUp", false, "M16 Elevator Up", "ILManualSubsplit");
					settings.SetToolTip("ILm16ElevatorUp","Elevator transition to Upper Floor");
				settings.Add("ILm16ElevatorDwn", false, "M16 Elevator Down", "ILManualSubsplit");
					settings.SetToolTip("ILm16ElevatorDwn","Elevator transition to Lower Floor");
				settings.Add("ILm17TransitElevator", false, "M17 Transit Elevator", "ILManualSubsplit");
					settings.SetToolTip("ILm17TransitElevator","Elevator that breakdown");
				settings.Add("ILm18VentGrab", false, "M18 Vent Grab", "ILManualSubsplit");
					settings.SetToolTip("ILm18VentGrab","Yeetus your Meatus");
				settings.Add("ILm18SpaceWalk", false, "M18 Space Walk", "ILManualSubsplit");
					settings.SetToolTip("ILm18SpaceWalk","Space Suit ''Change'' Prompt");
	settings.Add("CatExt", false, "Category Extensions");
	settings.SetToolTip("CatExt","Please select ONLY ONE of the below");
		settings.Add("death", false, "Death%", "CatExt");
			settings.SetToolTip("death","Timer Ends when Screen Turns Black");
		settings.Add("KillCiv", false, "Kill Civilian%", "CatExt");
			settings.SetToolTip("KillCiv","Timer Ends when Screen Turns Black");
#endregion
}
init
{
	if(modules.First().ModuleMemorySize == 0x1F81000){
        version = "Steam";
        } 
	else{
        version = "Epic";
        }

	vars.loading = false;
	vars.final = false;
	vars.SavedMap = null;	// Saved Map used as cross reference rather than having a BSP checker
	vars.fadetrigger = null;
	vars.repeatstopper = 0; // Stops Multiple Exection of splits
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
	if(settings["allmissions"] == true && vars.fadetrigger || settings["campaign"] == true && vars.fadetrigger){ // Detects if PLAYER is starting All Missions
			vars.SavedMap = current.Map;
		vars.repeatstopper = 0;
		return true;}
	else if(settings["any"] == true && vars.fadetrigger){ // Detects if PLAYER is starting Any% 
			vars.SavedMap = current.Map;
		vars.repeatstopper = 0;
		return true;}
	else if(settings["anyFPS"] == true && vars.fadetrigger){return true;} // Detects if PLAYER is on Any% CC+FPS, sets the splits to be on Map Change
	if(settings["dlc"] == true && current.fadeState == 2 && current.pX != 0){ // Detects if PLAYER is on DLC Maps and Starts Timer when player spawns into the world
		if(current.Map == "PRESENCE_NOSTROMO_RIPLEY" || current.Map == "PRESENCE_NOSTROMO_TWO_TEA"){
			vars.SavedMap = current.Map;
			return true;}
	}
	if(settings["ils"] == true && vars.fadetrigger && current.missionNum == 19 || settings["ils"] == true && vars.fadetrigger){
		vars.final = true;
		return true;}
#endregion
}
update
{	
#region Subsplit variables
	vars.m2Elevator = current.pX > 22.85 && current.pX < 26.11 && current.pZ > -108 && current.pZ < -104.5 && current.pY < 5;							// Elevator with Axel
	vars.m4ElevatorUp = current.pZ < 14.5 && current.pZ > 10.8 && current.pX > -7.4 && current.pX < -4.15 && current.pY > 24; 							// This is also used for M16 Elevator
	vars.m4ElevatorDwn = current.pZ < 15.5 && current.pZ > 11.5 && current.pX > -7.4 && current.pX < -4.15 && current.pY < 13 && current.pY > 12; 		// This is also used for M16 Elevator
	vars.M6ColdStorage = current.pY > 1 && current.pY < 2 && current.pZ > -23 && current.pZ < -20 && current.pX > -10 && current.pX < -8; 				// Vent Drop after Cold Storage
	vars.m7Elevator = current.pZ > 58.5 && current.pZ < 58.7 && current.pX > -22.55 && current.pX < -22.4 && current.pY > -15 && current.pY < -14.9; 	// Elevator after Spice Section
	vars.m8Elevator = current.pX > 31.2 && current.pX < 33.2 && current.pZ > 68.5 && current.pZ < 71 && current.pY > 9 && current.pY < 10;				// Elevator after pressing Button to Trasit Control
	vars.m9Derelict = current.pX >= -111.9 && current.pX <= -111.7 && current.pZ < 121.3 && current.pZ > 121;											// M9 transition to Derelict
	vars.m12vent = current.pX > -48.5 && current.pX < -47 && current.pZ > 38.5 && current.pZ < 39 && current.pY > 19.7; 								// Vent Entrance before seeing Samuels ruin Joe
	vars.m12ElevatorUp = current.pZ > 46.3 && current.pZ < 50.1 && current.pX > -30 && current.pX < -25 && current.pY > 19 && current.pY < 19.5;		// Elevator to Cryo Vents
	vars.m12ElevatorDwn = current.pZ > 46.3 && current.pZ < 50.1 && current.pX > -30 && current.pX < -25 && current.pY > 4 && current.pY < 4.2;			// Elevator From Cryo Vents
	vars.m13ventDrop = current.pZ > -2.6 && current.pZ < -1.1 && current.pX > -17.5 && current.pX < -15 && current.pY > 0.8 && current.pY < 1.2;		// Vent Drop inside APOLLO Area
	vars.m14ventDrop = current.pZ > -44 && current.pZ < -42 && current.pX > -24 && current.pX < -21 && current.pY > 16.3 && current.pY < 16.8;			// Vent Drop under Hoist
	vars.m17TransitElevator = current.pX > 52.4 && current.pX < 52.55 && current.pZ > 5.84 && current.pZ < 5.86;										// Elevator button that crashes
	vars.m18VentGrab = current.pX >= -105 && current.pX <= -103 && current.pZ >= 93 && current.pZ <= 96;												// YOINK
	vars.m18SpaceWalk = current.pX >= 21.4 && current.pX <= 22 && current.pY >= -20.8 && current.pY <= -20.6 && current.pZ >= -1 && current.pZ <= 0;	// Button Press on Space Suit
	vars.m2Tram = current.pX > 23.7 && current.pX < 24.1 && current.pZ > 52.16 && current.pZ < 52.18;													// M2 Tram Button Press
#endregion

	if (old.levelManagerState == 5 && current.levelManagerState == 7 || current.gameFlowState == 6){vars.loading = true;} 					// Check if on Loading Screen
	else if (current.fadeState == 2 && old.fadeNum < 0.2 && current.fadeNum > 0.2){	vars.loading = false;} 									// Check if on Loading Screen
	if (current.missionNum == 19 && current.fadeState == 2 && old.fadeNum < 0.5 && current.fadeNum > 0.5){vars.final = true;} 				// Checks if on final mission
	if (vars.mission == null && current.fadeState == 2 && old.fadeNum < 0.5 && current.fadeNum > 0.5){vars.mission = current.missionNum;} 	// Updates vars.mission with the current mission on game start
	if (old.missionNum != 19 && current.Map == "PRESENCE_MAIN_MENU"){vars.MainMenu = true;}
}
split
{
// Splits for DLC Maps
	if(settings["dlc"] == true && current.Map != vars.SavedMap){return true;}
#region Splits for Any% CC+FPS
	if(settings["anyFPS"] == true){
		if (vars.mission != null && current.Map != vars.SavedMap){
		vars.SavedMap = current.Map;
		return true;}
	else if (vars.final == true && current.fadeState == 1 && current.gameFlowState == 4){
		vars.final = false;
		return true;}
	}
#endregion
#region Splits for Any% CC Only
	if (settings["any"] == true){
		if (current.Map != vars.SavedMap){	// Splits if Map Name changes
			vars.SavedMap = current.Map;	// Updates Map Name
			return true;}
		else if (current.missionNum == 18 && vars.m18VentGrab && vars.repeatstopper == 0){
			vars.repeatstopper = 1;
			return true;}
		else if (current.missionNum == 18 && vars.m18SpaceWalk && current.pZ <= 0 && vars.repeatstopper == 1){
			vars.repeatstopper = 2;
			return true;}
		else if (vars.final == true && current.fadeState == 1 && current.gameFlowState == 4){return true;}
	}
#endregion
#region Splits for All Missions
	if(settings["allmissions"] == true && settings["yesSubsplit"]  == false || settings["ils"] == true && settings["ILyesSubsplit"] == false){
		if (vars.mission != null && current.missionNum > vars.mission){vars.mission = current.missionNum;
			return true;}
		else if (vars.final == true && current.fadeState == 1 && current.gameFlowState == 4){vars.final = false;
			return true;}
	}
#endregion
#region Splits for Subsplits
	if(settings["allmissions"] == true && settings["yesSubsplit"] == true || settings["ilsSub"] == true && settings["ILyesSubsplit"] == true){
		if (vars.final == true && current.fadeState == 1 && current.gameFlowState == 4){vars.final = false; // Splits timer for Fade out on M19
			return true;}
		else if (vars.SavedMap != current.Map || current.missionNum > vars.mission){ // On Map Change
			vars.repeatstopper = 0;
			vars.mission = current.missionNum;
			vars.SavedMap = current.Map;
			return true;}
		else if(current.missionNum == 9 && vars.m9Derelict && vars.repeatstopper == 0){ // M9 Derelict Transition
			vars.repeatstopper = 1;
			return true;}
	}
#endregion
#region Splits for Tram Timer
	if(settings["tramtimer"] == true){
		if(current.missionNum == 2 && vars.m2Tram && vars.repeatstopper == 0 || current.missionNum == 2 && vars.m2Tram && vars.repeatstopper == 1 ){
			vars.repeatstopper = 2;
			return true;}
	}
#endregion
#region Additional Splits (Subsplits included in IL's)
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
		if(current.missionNum == 6 && vars.M6ColdStorage && vars.repeatstopper == 0){ 			// M6 Vent Drop
			vars.repeatstopper = 1;
			return true;}}
	if(settings["m7Elevator"] == true || settings["ILm7Drop"] == true){
		if(current.missionNum == 7 && vars.m7Elevator && vars.repeatstopper == 0){ 				// M7 Vent Drop
			vars.repeatstopper = 1;
			return true;}}
	if(settings["m8Elevator"] == true || settings["ILm8Elevator"] == true){
		if(current.missionNum == 8 && vars.m8Elevator && vars.repeatstopper == 0){ 				// M8 Elevator
			vars.repeatstopper = 1;
			return true;}}
	if(settings["m12Vent"] == true || settings["ILm12Vent"] == true){
		if(current.missionNum == 12 && vars.m12vent && vars.repeatstopper == 0){ 				// M12 Vent
			vars.repeatstopper = 1;
			return true;}}
	if(settings["m12ElevatorUp"] == true || settings["ILm12ElevatorUp"] == true){
		if(current.missionNum == 12 && vars.m12ElevatorUp && vars.repeatstopper == 1){ 			// M12 Elevator Up
			vars.repeatstopper = 2;
			return true;}}
	if(settings["m12ElevatorDwn"] == true || settings["ILm12ElevatorDwn"] == true){
		if(current.missionNum == 12 && vars.m12ElevatorDwn && vars.repeatstopper == 2){ 		// M12 Elevator Down
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
		if(current.missionNum == 16  && vars.m4ElevatorDwn && vars.repeatstopper == 3){ 		// M16 Elevator Dwn
			vars.repeatstopper = 4;
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
#endregion
// Category Extensions
	if(settings["death"] == true && current.gameFlowState == 5 || settings["KillCiv"] == true && current.gameFlowState == 5){return true;}
}
isLoading
{
	return vars.loading;
}