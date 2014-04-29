/* serverSetSupply script
Created: 06/09/2013
Author: Markus Davey
Skype: markus.davey
Desc: Sets the supply for the specified side, to the specified value. Method dependent upon passed flag for modifying current value or to set to exact value.
Parameters: [value (num) ,side (side), mode (str)]
Return: NA
*/

private ['_val', '_mode', '_side'];
_val = _this select 0;
_side = _this select 1;
_mode = _this select 2;

if (_mode == "mod") exitWith
{
	call compile format ["uiNamespace setVariable ['MV_Shared_%1_SUPPLY', (uiNamespace getVariable 'MV_Shared_%1_SUPPLY') + _val];", _side];
};

if (_mode == "set") exitWith
{
	call compile format ["uiNamespace setVariable ['MV_Shared_%1_SUPPLY', _val];", _side];
};

diag_log format ["MV: ERROR: serverSetSupply: Unknown mode presented: %2 - Params: %1", _this, _mode];