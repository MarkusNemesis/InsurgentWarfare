/* serverInitFunctions script
Created: 01/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Precompiles functions and makes them available. There are restricted to the serverside scope.
*/

MV_Server_fnc_initPlayerSlots 					= 	compileFinal preprocessFileLineNumbers "Server\functions\ServerInitPlayerSlots.sqf";
MV_Server_fnc_OnPlayerConnected 				= 	compileFinal preprocessFileLineNumbers "Server\functions\serverOnPlayerConnected.sqf";
MV_Server_fnc_OnPlayerDisconnected 				= 	compileFinal preprocessFileLineNumbers "Server\functions\serverOnPlayerDisconnected.sqf";
MV_Server_fnc_SpawnStartingVehicles 			= 	compileFinal preprocessFileLineNumbers "Server\functions\serverSpawnStartingVehicles.sqf";
MV_Server_fnc_HandleVehicleSpawn 				= 	compileFinal preprocessFileLineNumbers "Server\functions\serverHandleVehicleSpawn.sqf";
MV_Server_fnc_GetMoney 							= 	compileFinal preprocessFileLineNumbers "Server\functions\economy\serverGetMoney.sqf";
MV_Server_fnc_SetMoney 							= 	compileFinal preprocessFileLineNumbers "Server\functions\economy\serverSetMoney.sqf";
MV_Server_fnc_GetSupply 						= 	compileFinal preprocessFileLineNumbers "Server\functions\economy\serverGetSupply.sqf";
MV_Server_fnc_SetSupply 						= 	compileFinal preprocessFileLineNumbers "Server\functions\economy\serverSetSupply.sqf";
MV_Server_fnc_SetObjectVariable					= 	compileFinal preprocessFileLineNumbers "Server\functions\missionVariables\serverSetObjectVariable.sqf";
MV_Server_fnc_GetObjectVariable					= 	compileFinal preprocessFileLineNumbers "Server\functions\missionVariables\serverGetObjectVariable.sqf";

// MV_Server_fnc_ 						= 	compileFinal preprocessFileLineNumbers "Server\functions\";

// ------------------------------------------------------------------------------------------------------------------------------------

// -- Init function libraries (Shouldn't be done, as you cannot compile final the script contents ie: function1 = compileFinal {Script};

// call compileFinal preprocessFileLineNumbers "Server\functions\"