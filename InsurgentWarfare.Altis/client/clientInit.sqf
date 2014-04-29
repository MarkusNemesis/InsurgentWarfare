/* clientInit script
Created: 02/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Initialises all the systems required for the client. Functions, variables, etc.
*/

private ["_runTime"];
_runTime =+ time;

waitUntil {!isNull player}; // Make sure the player exists before starting.
waitUntil{player==player};
waitUntil{alive player};
waitUntil{local player};

diag_log "MV: CLIENT INIT: STARTED";

// Init client functions
call compileFinal preprocessFileLineNumbers "Client\functions\clientInitFunctions.sqf";

// Initialize shared resources
call compileFinal preprocessFileLineNumbers "Shared\sharedInit.sqf";

// Client constants
Client_PlayerName = str name player;
Client_PlayerSide = side player;
Client_PlayerSideStr = str Client_PlayerSide;

// Init client globals
Client_PlayerGarbageCollection = []; // This variable is filled with objects to be cleaned up / managed after a set time. [obj, cleandelay]
Client_PlayerDeathObjectCollection = []; // This variable is filled with objects that are handled immediatly upon the death of the player.
Client_PlayerSpawned = false;
Client_EventArray = []; // Client_EventArray elements contain: ["function_name", [args], priority]
Client_VehicleMarkers = [];

// Public Variables
// SERVER FETCHED VARIABLES ->
// All network fetched variables are initialized here. This should be done as late as possible.

switch (side player) do
{
	case west: {
		waitUntil{!isnil 'MV_Netvar_WESTVEHICLES'}; // For map markers
	};
	case east: {
		waitUntil{!isnil 'MV_Netvar_EASTVEHICLES'}; // For map markers
	};
};

// <- SERVER FETCHED VARIABLES
//
setViewDistance 2000; // Default view distance.
enableSaving [false, false];

// init Params
call MV_Shared_fnc_initParams;

// Init Event handlers
call MV_Client_fnc_InitEventHandlers;

// **** CODE AFTER THIS POINT IS RAN DURING MISSION TIME ****
waituntil {time > 0}; // Checks if the mission has actually started.
finishMissionInit;

// Create player spawn event
["MV_Client_fnc_SpawnPlayer", [], 1] call MV_Client_fnc_AddEvent; 

// YOU MUST Leave this last. This calls the clientCore mainloop.
_runTime = time - _runTime;
diag_log format ["MV: CLIENT INIT: FINISHED, Time taken: %1", _runTime];
// -- Ensure a script error doesn't kill the main loop, by making it failsafe.
private ['_mainloop', '_lHandle'];
_mainloop = compile preprocessFileLineNumbers "Client\clientCore.sqf";
_lHandle = [] spawn _mainloop;
waitUntil
{
	waitUntil {sleep 1; scriptDone _lHandle}; // -- Handles whether the mainloop has died and thus, starts it back up again.
	_lHandle = [] spawn _mainloop;
	false
};