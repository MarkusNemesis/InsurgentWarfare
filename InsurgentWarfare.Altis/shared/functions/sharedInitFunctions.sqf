/* sharedInitFunctions script
Created: 02/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Precompiles functions and makes them available. They are not restricted and can be called on both server and client.
*/

MV_Shared_fnc_initParams = compileFinal preprocessFileLineNumbers "shared\functions\sharedInitParams.sqf";
MV_Shared_fnc_SetSuperAI = compileFinal preprocessFileLineNumbers "shared\functions\sharedSetSuperAI.sqf";
MV_Shared_fnc_getRandomPosition = compileFinal preprocessFileLineNumbers "shared\functions\sharedGetRandomPosition.sqf";
MV_Shared_fnc_GetPlayers = compileFinal preprocessFileLineNumbers "shared\functions\sharedGetPlayers.sqf";
MV_Shared_fnc_GetPlayerObject = compileFinal preprocessFileLineNumbers "shared\functions\sharedGetPlayerObject.sqf";
MV_Shared_fnc_IsHQDeployed = compileFinal preprocessFileLineNumbers "shared\functions\sharedIsHQDeployed.sqf";
MV_Shared_fnc_IsHQ = compileFinal preprocessFileLineNumbers "shared\functions\sharedIsHQ.sqf";

// MV_Shared_fnc_ = compileFinal preprocessFileLineNumbers "shared\functions\";