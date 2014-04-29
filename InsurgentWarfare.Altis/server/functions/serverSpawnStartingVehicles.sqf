/* serverSpawnStartingVehicles script
Created: 11/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: spawns all the vehicles that the round starts with. ie, HQs, Ambulances, trucks, etc.
Return: null
*/

private ["_MidPoint", "_MinDistance", "_WestStartPos", "_EastStartPos"];
_MidPoint = [15000,15000,0]; // -- The location where the centre of the map is. For determining spown location. TODO -- make map dependent
_MinDistance = 8000; // -- Minimum distance between team starting positions -- TODO get from parameters

// -- Calc start positions
_WestStartPos = [_MidPoint, _MinDistance, false, [false, 1000]] call MV_Shared_fnc_getRandomPosition;
_EastStartPos = _WestStartPos;
while {(_WestStartPos distance _EastStartPos) < _MinDistance} do // -- Ensure that teams are at least the minimum distance apart.
{
	_EastStartPos = [_MidPoint, _MinDistance, false, [false, 1000]] call MV_Shared_fnc_getRandomPosition;
};

// -- Spawn each side -- TODO optimise this a bit, as it's a bit unmanagable.
{
	private ["_startPos", "_ambo", "_truck"];
	call compile format ["
	_startPos = _%1StartPos;
	

	MV_Shared_%1_HQ = createVehicle [MV_Shared_CLASS_%1_HQ, _startPos, [], 100, 'NONE'];
	[MV_Shared_%1_HQ,%1, 'HQ'] call MV_Server_fnc_HandleVehicleSpawn;
	publicVariable 'MV_Shared_%1_HQ';
	

	_ambo = createVehicle [MV_Shared_CLASS_%1_AMBO, ([([[random 2 - 1, random 2 - 1, 0] call BIS_fnc_unitVector, 50] call BIS_fnc_vectorMultiply), getPosATL MV_Shared_%1_HQ] call BIS_fnc_vectorAdd), [], 0, 'NONE'];
	[_ambo, %1, 'Ambo'] call MV_Server_fnc_HandleVehicleSpawn;
	_ambo setVectorDir ([getPosATL MV_Shared_%1_HQ, getPosATL _ambo] call BIS_fnc_vectorFromXToY);
	
	_truck = createVehicle [MV_Shared_CLASS_%1_TRUCK, ([([[random 2 - 1, random 2 - 1, 0] call BIS_fnc_unitVector, 50] call BIS_fnc_vectorMultiply), getPosATL MV_Shared_%1_HQ] call BIS_fnc_vectorAdd), [], 50, 'NONE'];
	[_truck, %1, ''] call MV_Server_fnc_HandleVehicleSpawn;
	_truck setVectorDir ([getPosATL MV_Shared_%1_HQ, getPosATL _truck] call BIS_fnc_vectorFromXToY);
	
	

	
	", _x];
	// -- _ambo setPosATL ([([[random 2 - 1, random 2 - 1, 0] call BIS_fnc_unitVector, 50] call BIS_fnc_vectorMultiply), getPosATL MV_Shared_%1_HQ] call BIS_fnc_vectorAdd);
	
	/*
	_markerName ='Marker_%1_HQ';
	_markerName = createMarker [_markerName,_startPos];
	_markerName setMarkerShape 'ICON';
	_markerName setMarkerType 'mil_dot';
	_markerName setMarkerText _x;
	*/
	//call compile format ["_ambo = createVehicle [MV_Shared_CLASS_%1_AMBO, _startPos, [], 10, 'NONE']", _x];
} foreach ["east", "west"];