/* serverOnPlayerConnected script
Created: 09/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Runs when a player connects to the server. Stores their name, slotname, etc.
*/
private ['_id','_name','_uid', '_slotName'];
_id = _this select 0;
_name = _this select 1;
_uid = _this select 2;
_slotName = "";
diag_log format ["onPlayerConnected: %1, %2, %3", _id, _name, _uid];

// Ensure player name __SERVER__ is ignored.
if (_name == "__SERVER__") exitwith {};

// Find the player's slot name.
waitUntil {
	{
		//diag_log (name _x);
		if (_name == name _x) exitwith {_slotname = str _x};
	} foreach MV_Shared_PLAYERS_BLU + MV_Shared_PLAYERS_OP + MV_Shared_PLAYERS_IND + MV_Shared_PLAYERS_CIV;
	_slotname != ""
};

private ['_pFound'];
_pFound = false;
// -- Check if player is already in the player registry.
{
	if (_uid == (_x select 0)) exitwith 
	{// -- User is in the registry!
		// -- TODO -- Set the player's registry slot value to it's new slot.
		
		_pFound = true;
	};
} foreach Server_PlayerRegistry;
//Add player to the Server_PlayerRegistry
if (!_pFound) then
{
	diag_log format ["Player slot NetID: %1, Player slot name: %2", netID (call compile _slotname), _slotname];
	// -- Create player registry entry
	Server_PlayerRegistry set [count Server_PlayerRegistry, [_id, _name, _uid, _slotname]]; 
	// -- Create player's serverside variable array
	(uiNamespace getVariable "Server_LocObj") setVariable [format ["%1_mVar", _uid], []];
	// -- Set up player's personal values. ie, Money, loadout, etc.
	[netID (call compile _slotname), ['money', 3200]] call MV_Server_fnc_SetObjectVariable; // -- TODO pull starting money values from parameters
	// -- TODO set default loadout.
} else {
	// -- Else TODO - set player's loadout based off past loutout (if it exists)
	// -- TODO set other character based values.
};