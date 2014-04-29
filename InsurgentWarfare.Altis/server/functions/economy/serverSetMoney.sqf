/* serverSetMoney script
Created: 06/09/2013
Author: Markus Davey
Skype: markus.davey
Desc: Sets the object's money. Has two modes, set and modify.
Set: Sets the object's money to that value
Modify: Adds the value to it's existing value. ie 3200 + -1000 = 2200
Parameters: [value, netID Player, mode]
Return:
*/

private ['_val', '_ID', '_mode'];
_val = _this select 0;
_ID = _this select 1;
_mode = _this select 2;

if (_mode == "mod") exitWith
{
	[_ID, ['money', (([_ID] call MV_Server_fnc_GetMoney) + _val)]] call MV_Server_fnc_SetObjectVariable;
};

if (_mode == "set") exitWith
{
	[_ID, ['money', _val]] call MV_Server_fnc_SetObjectVariable;
};

diag_log format ["MV: ERROR: serverSetMoney: Unknown mode presented: %2 - Params: %1", _this, _mode];

