/* ServerInit script
Created: 01/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Initialises all the systems required for the mission. Functions, variables, etc.
*/

private ["_runTime"];
_runTime =+ time;

diag_log "MV: SERVER INIT: STARTED";

// Init server functions
call compileFinal preprocessFileLineNumbers "server\functions\serverInitFunctions.sqf";

// Initialize shared resources only if the server is dedicated. Otherwise the client and server will both init shared.
//if (isDedicated) then {call compileFinal preprocessFileLineNumbers "Shared\sharedInit.sqf";};

call compileFinal preprocessFileLineNumbers "Shared\sharedInit.sqf"; // -- TODO remove this, and reinstate the above

// -- Init serverside local location - This holds serverside data like player loadouts, player money, supply values, towns, etc etc.
private ['_slocN'];
_slocN = format ['%1%2%3', (profileName), (round (random 10000)), round serverTime];
call compile format ["%1 = createLocation ['NameVillage', [0, 0, 0], 1, 1];", _slocN];
uiNamespace setVariable ["Server_LocObj", call compile _slocN];

// init Params
call MV_Shared_fnc_initParams;

// Init global variables
Server_PlayerRegistry = []; // Format: [id, playerName, UID, playerSlot];

// -- Init public variables
MV_Netvar_WESTVEHICLES = [];
publicVariable "MV_Netvar_WESTVEHICLES";
MV_Netvar_EASTVEHICLES = [];
publicVariable "MV_Netvar_EASTVEHICLES";

// ---- Set up sides
// -- Set up supply values
[3200, west, 'set'] call MV_Server_fnc_SetSupply;
[3200, east, 'set'] call MV_Server_fnc_SetSupply;

// OnPlayerConnected
OnPlayerConnected "[_id, _name, _uid] spawn MV_Server_fnc_OnPlayerConnected;";

// OnPlayerDisconnected
OnPlayerDisconnected "[_id, _name, _uid] spawn MV_Server_fnc_OnPlayerDisconnected;";

// -------- CODE AFTER THIS POINT IS RAN DURING MISSION TIME --------
waituntil {time > 0}; // Checks if the mission has actually started.


// Init playerslots
[] call MV_Shared_fnc_GetPlayers;
[MV_Shared_PLAYERS_BLU + MV_Shared_PLAYERS_OP + MV_Shared_PLAYERS_IND + MV_Shared_PLAYERS_CIV] call MV_Server_fnc_initPlayerSlots;

// -- Spawn HQs and starting vehicles at spawn points.
call MV_Server_fnc_SpawnStartingVehicles;

// YOU MUST Leave this last. This calls the serverCore mainloop.
MV_Netvar_SERVERINITCOMPLETE = true;
publicVariable "MV_Netvar_SERVERINITCOMPLETE";
//
_runTime = time - _runTime;
diag_log format ["MV: server INIT: FINISHED, Time taken: %1", _runTime];
// -- Ensure a script error doesn't kill the main loop, by making it failsafe.
private ['_mainloop', '_lHandle', '_timesRecovered'];
_mainloop = compile preprocessFile "server\serverCore.sqf";
_lHandle = [] spawn _mainloop;
_timesRecovered = 0;
waitUntil
{
	waitUntil {sleep 1; scriptDone _lHandle}; // -- Handles whether the mainloop has died and thus, starts it back up again.
	_lHandle = [] spawn _mainloop;
	diag_log format ["MV: WARN: SERVER MAINLOOP RECOVERED. Times recovered: %1", _timesRecovered];
	_timesRecovered = _timesRecovered + 1;
	false
};