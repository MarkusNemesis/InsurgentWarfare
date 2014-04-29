/* sharedGetPlayerObject script
Created: 10/04/2013
Author: Markus Davey
Skype: markus.davey
Desc: Returns player object if the passed object is a player, and iskindof 'man' (Thus, not in a vehicle).
Params: [_obj]
Return: player object, if it is one. else, objnull
*/

private ['_Obj', '_return'];
_obj = _this select 0;
_return = objNull;

if ((typeof _obj) == (typeof vehicle _obj)) then 
{
	if (isplayer _obj) then {_return = _obj};
};

_return