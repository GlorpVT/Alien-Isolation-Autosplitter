state("AI", "Steam") 									// Script Written by Spaz (Any Issues, Please place a query on #Support in the Alien: Isolation Discord)
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
	short SaveIcon : 0x12F0C88, 0x4C, 0x8, 0x8, 0x33C;
}
state("AI", "Epic")
{
	int fadeState : 0x15E2664;
	float fadeNum : 0x15E2668;
	byte gameFlowState : 0x012526BC, 0x8;
	int levelManagerState : 0x0130D30C, 0x68, 0x4C;
	byte loadingIcon : 0x01366CAC, 0xF50, 0x1D;
	int missionNum : 0x130D1A8, 0x78, 0x10EC;
	string25 Map : 0x017F49B4, 0x4, 0x446;
	float pX : 0x3FF598, 0x80;
	float pY : 0x3FF598, 0x84;
	float pZ : 0x3FF598, 0x88;
    short SaveIcon : 0x130F868, 0x33C;
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
			settings.Add("yesSubsplit", false, "Split on Load Screens", "amsubsplit");
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
					settings.Add("m9Fade", false, "M9 Part 1 Fade Out", "m9Splits");
					settings.Add("m9Meeks", false, "M9 Meeks Boost", "m9Splits");
				settings.Add("m12Vent", false, "M12 Vent", "ManualSubsplit");
				settings.Add("m12ElevatorUp", false, "M12 Elevator Up", "ManualSubsplit");
				settings.Add("m12ElevatorDwn", false, "M12 Elevator Down", "ManualSubsplit");
				settings.Add("m13VentDrop", false, "M13 Vent Drop", "ManualSubsplit");
				settings.Add("m14VentDrop", false, "M14 Vent Drop", "ManualSubsplit");
				settings.Add("m16ElevatorUp", false, "M16 Elevator Up", "ManualSubsplit");
				settings.Add("m16ElevatorDwn", false, "M16 Elevator Down", "ManualSubsplit");
				settings.Add("m17TransitElevator", false, "M17 Transit Elevator", "ManualSubsplit");
				settings.Add("m18VentGrab", false, "M18 Vent Grab", "ManualSubsplit");
				settings.Add("m18SpaceWalk", false, "M18 Space Walk", "ManualSubsplit");
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
				settings.Add("ILm4ElevatorUp", false, "M4 Elevator Up", "ILManualSubsplit");
				settings.Add("ILm4ElevatorDwn", false, "M4 Elevator Down", "ILManualSubsplit");
				settings.Add("ILm6ColdStorage", false, "M6 Vent Drop", "ILManualSubsplit");
				settings.Add("ILm7Elevator", false, "M7 Vent Drop", "ILManualSubsplit");
				settings.Add("ILm8Elevator", false, "M8 Elevator", "ILManualSubsplit");
				settings.Add("ILm9Splits", false, "M9 Splits", "ILManualSubsplit");
					settings.Add("ILm9Heyst_1", false, "M9 Heyst First Boost", "ILm9Splits");
					settings.Add("ILm9Heyst_2", false, "M9 Heyst Second Boost", "ILm9Splits");
					settings.Add("ILm9Fade", false, "M9 Part 1 Fade Out", "ILm9Splits");
					settings.Add("ILm9Meeks", false, "M9 Meeks Boost", "ILm9Splits");
				settings.Add("ILm12Vent", false, "M12 Vent", "ILManualSubsplit");
				settings.Add("ILm12ElevatorUp", false, "M12 Elevator Up", "ILManualSubsplit");
				settings.Add("ILm12ElevatorDwn", false, "M12 Elevator Down", "ILManualSubsplit");
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
	settings.Add("DEVTOOLS", false, "DEV TOOLS");	
		settings.Add("DPS", false, "DPS Tracker", "DEVTOOLS");
		settings.Add("PlayerPos", false, "Player Tracker", "DEVTOOLS");
		settings.Add("TramTimer", false, "Tram Timer", "DEVTOOLS");
			settings.Add("M2Tram", false, "M2 Tram", "TramTimer");
			settings.Add("M8Tram", false, "M8 Tram", "TramTimer");
			settings.Add("M10Tram", false, "M10 Tram", "TramTimer");
			settings.Add("M11Tram", false, "M11 Tram", "TramTimer");
			settings.Add("M12Tram", false, "M12 Tram", "TramTimer");
			settings.Add("M14Tram", false, "M14 Tram", "TramTimer");
#endregion
#region ToolTips
	settings.SetToolTip("campaign","If nothing selected below this, All Missions is DEFAULTED.");
        settings.SetToolTip("m2Elevator","Elevator with Axel");
		settings.SetToolTip("m4ElevatorUp","Elevator transition to Upper Floor");
		settings.SetToolTip("m4ElevatorDwn","Elevator transition to Lower Floor");
		settings.SetToolTip("m6ColdStorage","Vent Drop after Cold Storage");
		settings.SetToolTip("m7Elevator","Elevator after Compression Cylinder is Obtained");
		settings.SetToolTip("m8Elevator","Elevator transision to Transit Control");
		settings.SetToolTip("m12Vent","Vent Entrance before Samuels kills Joe");
		settings.SetToolTip("m12ElevatorUp","Elevator to Cryo Vents");
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
	settings.SetToolTip("DEVTOOLS","ASL Var Viewer DLL is REQUIRED to View These");
        settings.SetToolTip("DPS","Gives Access to Health and Incoming Damage Values");
		settings.SetToolTip("PlayerPos","Gives Access to Player Position Values");
		settings.SetToolTip("TramTimer","Timer will stay Paused after the loading screen");
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
		vars.repeatstopper = 0;
		return true;
	}
#endregion
}
update
{	
#region Subsplit variables - Variables are only Visible if the ["Setting"] is Checked
if(settings["yesSubsplit"] || settings["ILyesSubsplit"]){
	vars.m2Elevator = current.pX > 22.85 && current.pX < 26.11 && current.pZ > -108 && current.pZ < -104.5 && current.pY < 5;							// Elevator with Axel
	vars.m4ElevatorUp = current.pZ < 14.5 && current.pZ > 10.8 && current.pX > -7.4 && current.pX < -4.15 && current.pY > 24; 							// This is also used for M16 Elevator
	vars.m4ElevatorDwn = current.pZ < 15.5 && current.pZ > 11.5 && current.pX > -7.4 && current.pX < -4.15 && current.pY < 13 && current.pY > 12; 		// This is also used for M16 Elevator
	vars.m6ColdStorage = current.pY > 1 && current.pY < 2 && current.pZ > -23 && current.pZ < -20 && current.pX > -10 && current.pX < -8; 				// Vent Drop after Cold Storage
	vars.m7Elevator = current.pZ > 58.5 && current.pZ < 58.7 && current.pX > -22.55 && current.pX < -22.4 && current.pY > -15 && current.pY < -14.9; 	// Elevator after Spice Section
	vars.m8Elevator = current.pX > 31.2 && current.pX < 33.2 && current.pZ > 68.5 && current.pZ < 71 && current.pY > 9 && current.pY < 10;				// Elevator after pressing Button to Trasit Control
	vars.m9Heyst_1 = current.pX > 48.7 && current.pX < 48.75 && current.pZ > 0.7 && current.pZ < 0.74 && current.pY > -18.1 && current.pY < -18;		// M9 First Heyst Leg-Up
	vars.m9Heyst_2 = current.pX > 74.18 && current.pX < 74.20 && current.pZ > 21.3 && current.pZ < 21.4 && current.pY > -15.25 && current.pY < -15.2;  	// M9 Second Heyst Leg-Up
	vars.m9Derelict = current.pX >= -111.9 && current.pX <= -111.7 && current.pZ < 121.3 && current.pZ > 121;											// M9 Transition to Derelict
	vars.m9Meeks = current.pX > -45.4 && current.pX < -45.3 && current.pZ > -13.3 && current.pZ < -13.25 && current.pY > 1.45 && current.pY < 1.5;		// M9 Meeks Leg-Up
	vars.m12vent = current.pX > -48.5 && current.pX < -47 && current.pZ > 38.5 && current.pZ < 39 && current.pY > 19.7; 								// Vent Entrance before seeing Samuels ruin Joe
	vars.m12ElevatorUp = current.pZ > 46.3 && current.pZ < 50.1 && current.pX > -30 && current.pX < -25 && current.pY > 19 && current.pY < 19.5;		// Elevator to Cryo Vents
	vars.m12ElevatorDwn = current.pZ > 46.3 && current.pZ < 50.1 && current.pX > -30 && current.pX < -25 && current.pY > 4 && current.pY < 4.2;			// Elevator From Cryo Vents
	vars.m13ventDrop = current.pZ > -2.6 && current.pZ < -1.1 && current.pX > -17.5 && current.pX < -15 && current.pY > 0.8 && current.pY < 1.2;		// Vent Drop inside APOLLO Area
	vars.m14ventDrop = current.pZ > -44 && current.pZ < -42 && current.pX > -24 && current.pX < -21 && current.pY > 16.3 && current.pY < 16.8;			// Vent Drop under Hoist
	vars.m17TransitElevator = current.pX > 52.4 && current.pX < 52.55 && current.pZ > 5.84 && current.pZ < 5.86;										// Elevator button that crashes
	vars.m18VentGrab = current.pX >= -105 && current.pX <= -103 && current.pZ >= 93 && current.pZ <= 96;												// YOINK
	vars.m18SpaceWalk = current.pX >= 21.4 && current.pX <= 22 && current.pY >= -20.8 && current.pY <= -20.6 && current.pZ >= -1 && current.pZ <= 0;	// Button Press on Space Suit
}
if(settings["m9Splits"] == true){
	if((settings["m9Heyst_1"] == false || settings["ILm9Heyst_1"] == false) && current.missionNum == 9 && vars.m9Heyst_1){vars.repeatstopper = 1;}	// M9 Heyst first Leg-up
	if((settings["m9Heyst_2"] == false || settings["ILm9Heyst_2"] == false) && current.missionNum == 9 && vars.m9Heyst_2){vars.repeatstopper = 2;}	// M9 Heyst Second Leg-up
	if((settings["m9Fade"] == false || settings["ILm9Fade"] == false) && current.missionNum == 9 && vars.m9Derelict){vars.repeatstopper = 3;}		// M9 Fade Transition
	if((settings["m9Meeks"] == false || settings["ILm9Meeks"] == false) && current.missionNum == 9 && vars.m9Meeks){vars.repeatstopper = 4;}		// M9 Meks Leg-up
}
if(settings["DPS"] == true && (settings["dlc"] == false || settings["campaign"] == false || settings["ils"] == false || settings["CatExt"] == false)){
	vars.Health = current.Save_Icon;
	vars.Damaged = 0;
	if(current.Save_Icon < old.Save_Icon){vars.Damaged = (old.Save_Icon - current.Save_Icon);}
	if(current.Save_Icon > old.Save_Icon){vars.Damaged = 0;}
}
if(settings["TramTimer"] == true && (settings["dlc"] == false || settings["campaign"] == false || settings["ils"] == false || settings["CatExt"] == false)){
	vars.m2Tram = current.pX > 23.7 && current.pX < 24.1 && current.pZ > 52.16 && current.pZ < 52.18;			// M2 Tram Button Press
	vars.m8Tram = current.pX > -7.5 && current.pX < -7.4 && current.pZ > 39.35 && current.pZ < 39.36;			// M8 Tram
	vars.m10Tram = current.pX > 39.3 && current.pX < 39.4 && current.pZ > -28.6 && current.pZ < -28.5;			// M10 Tram
	vars.m11Tram = current.pX > 50.6 && current.pX < 50.7 && current.pZ > -22.9 && current.pZ < -22.7;			// M11 Tram
	vars.m12Tram = current.pX > -10.1 && current.pX < -9.9 && current.pZ > 38.7 && current.pZ < 38.8;			// M12 Tram
	vars.m14Tram = current.pX > -5.91 && current.pX < -5.9 && current.pZ > -41.73 && current.pZ < -41.72;		// M14 Tram
	if(current.Map != vars.SavedMap){vars.loading = true;}
}
if(settings["PlayerPos"] == true && (settings["dlc"] == false || settings["campaign"] == false || settings["ils"] == false || settings["CatExt"] == false)){
    vars.PlayerX = current.pX;
    vars.PlayerY = current.pY;
    vars.PlayerZ = current.pZ;
}
#endregion
	if((old.levelManagerState == 5 && current.levelManagerState == 7 || current.gameFlowState == 6) || settings["DEVTOOLS"] == true && (settings["campaign"] == true || settings["CatExt"] == true || settings["dlc"] == true || settings["ils"] == true)){vars.loading = true;}
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
		if (vars.mission != null && current.Map != vars.SavedMap){
		vars.SavedMap = current.Map;
		return true;}
	else if (vars.final == true && current.fadeState == 1 && current.gameFlowState == 4){
		vars.final = false;
		return true;}
	}
// Splits for Any%
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
// Splits for All Missions
	if(settings["allmissions"] == true && settings["yesSubsplit"]  == false || settings["ils"] == true && settings["ILyesSubsplit"] == false){
		if (vars.mission != null && current.missionNum > vars.mission){vars.mission = current.missionNum;
			return true;}
		else if (vars.final == true && current.fadeState == 1 && current.gameFlowState == 4){vars.final = false;
			return true;}
	}
// Splits for Subsplits
	if(settings["allmissions"] == true && settings["yesSubsplit"] == true || settings["ilsSub"] == true && settings["ILyesSubsplit"] == true){
		if (vars.final == true && current.fadeState == 1 && current.gameFlowState == 4){vars.final = false; // Splits timer for Fade out on M19
			return true;}
		else if (vars.SavedMap != current.Map || current.missionNum > vars.mission){ // On Map Change
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
	if(settings["m9Fade"] == true || settings["ILm9Fade"] == true){	
		if(current.missionNum == 9 && vars.m9Derelict && vars.repeatstopper == 2 ){ 			// M9 Derelict Transition
			vars.repeatstopper = 3;
			return true;}}
	if(settings["m9Meeks"] == true || settings["ILm9Meeks"] == true){	
		if(current.missionNum == 9 && vars.m9Meeks && vars.repeatstopper == 3){ 				// M9 Meeks Leg-Up
			vars.repeatstopper = 4;
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
// Dev Tools
	if(settings["DEVTOOLS"] == true && current.Map != vars.SavedMap){return true;}
#endregion
}
isLoading{return vars.loading;}