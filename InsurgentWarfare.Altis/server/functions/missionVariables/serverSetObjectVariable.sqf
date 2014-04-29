/* serverSetObjectVariable script
Created: 06/09/2013
Author: Markus Davey
Skype: markus.davey
Desc: Changes a value within the passed object's serverside variable array.
Parameters: ['netID', ['arrayType', [content,array,etc]];
Example: [_playerID, ['money', [25000]]];
Return: N/A

Objects need to init their variable before it can be used: Use (uiNamespace getVariable "Server_LocObj") setVariable [format ["%1_missionVar", id], []];
*/

diag_log format ['MV: serverSetObjectVariable: %1', _this];
private ['_lObj', '_ID', '_args', '_obj', '_mVarName','_mArray', '_found'];
_lObj = uiNamespace getVariable "Server_LocObj";
_ID = _this select 0;
_args = _this select 1;
_obj = (objectFromNetId _ID);

// -- Am I dealing with a player?
if (!isnull ([_obj] call MV_Shared_fnc_GetPlayerObject)) then 
{
	_ID = getPlayerUID _obj;
};


_mVarName = format ["%1_mVar", _ID];
_found = false;
_mArray = [];
// -- Find the array that contains the type of array we're after.
//diag_log format ["MV: User's varname is: %1", _mVarName];
_mArray = _lObj getVariable _mVarName;

if (isnil "_mArray") exitwith {diag_log format ["MV: serverSetObjectVariable: ERROR: %1 has no missionVar. Args: %2", _ID, _args];};

{
	if ((_x select 0) == (_args select 0)) exitwith 
	{
		_mArray set [_foreachindex, _args];
		_found = true;
	};
} foreach _mArray;

// -- If it's not found, then just tack the 'set' to the end of the array.
if (!_found) then 
{
	_mArray set [count _mArray, _args];
};

// -- Finally, set the Server_LocObj variable again.
_lObj setVariable [_mVarName, _mArray];