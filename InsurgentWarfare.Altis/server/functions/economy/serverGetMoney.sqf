/* serverGetMoney script
Created: 06/09/2013
Author: Markus Davey
Skype: markus.davey
Desc: Gets the money from a specific player's pool.
Parameters: [playerNID (Player's netId)]
Return: money (Number)
*/

["Money", ([_this select 0, "money"] call MV_Server_fnc_GetObjectVariable)]