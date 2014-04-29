/* clientInitFunctions script
Created: 01/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: declares and compiles all the client specific functions.
Return:
*/

MV_Client_fnc_AddEvent = compileFinal preprocessFileLineNumbers "client\functions\clientAddEvent.sqf";
MV_Client_fnc_RemoveEvent = compileFinal preprocessFileLineNumbers "client\functions\clientRemoveEvent.sqf";
MV_Client_fnc_SpawnPlayer = compileFinal preprocessFileLineNumbers "client\functions\clientSpawnPlayer.sqf";
MV_Client_fnc_AddGarbage = compileFinal preprocessFileLineNumbers "client\functions\clientAddGarbage.sqf";
MV_Client_fnc_AddDeathObject = compileFinal preprocessFileLineNumbers "client\functions\clientAddDeathObject.sqf";
MV_Client_fnc_InitEventHandlers = compileFinal preprocessFileLineNumbers "client\functions\clientInitEventHandlers.sqf";
MV_Client_fnc_KilledEH = compileFinal preprocessFileLineNumbers "client\functions\clientKilledEH.sqf";
MV_Client_fnc_RespawnEH = compileFinal preprocessFileLineNumbers "client\functions\clientRespawnEH.sqf";
MV_Client_fnc_HitEH = compileFinal preprocessFileLineNumbers "client\functions\clientHitEH.sqf";
MV_Client_fnc_RunGarbageCollector = compileFinal preprocessFileLineNumbers "client\functions\clientRunGarbageCollector.sqf";
MV_Client_fnc_KillMessage = compileFinal preprocessFileLineNumbers "client\functions\clientKillMessage.sqf";
MV_Client_fnc_VehicleMapMarkers = compileFinal preprocessFileLineNumbers "client\functions\clientVehicleMapMarkers.sqf";

// -- Construction interface
MV_Client_fnc_ConCreateCamera = compileFinal preprocessFileLineNumbers "client\functions\constructionInterface\clientConCreateCamera.sqf";
MV_Client_fnc_ConFunctions = compileFinal preprocessFileLineNumbers "client\functions\constructionInterface\clientConFunctions.sqf";
MV_Client_fnc_ConInitInterface = compileFinal preprocessFileLineNumbers "client\functions\constructionInterface\clientConInitInterface.sqf";
MV_Client_fnc_ConInterfaceRuntime = compileFinal preprocessFileLineNumbers "client\functions\constructionInterface\clientConInterfaceRuntime.sqf";
MV_Client_fnc_ConMenu = compileFinal preprocessFileLineNumbers "client\functions\constructionInterface\clientConMenu.sqf";

// MV_Client_fnc_ = compileFinal preprocessFileLineNumbers "client\functions\";