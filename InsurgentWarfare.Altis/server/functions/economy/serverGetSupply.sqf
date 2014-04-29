/* serverGetSupply script
Created: 06/09/2013
Author: Markus Davey
Skype: markus.davey
Desc: Returns the current supply pool value for the specific side.
Parameters: [side]
Return: side's supply (Number)
*/

call compile format ["uiNamespace getVariable 'MV_Shared_%1_SUPPLY'", _this select 0]