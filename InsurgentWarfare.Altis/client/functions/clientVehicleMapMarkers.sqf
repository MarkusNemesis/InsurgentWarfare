/* clientVehicleMapMarkers script
Created: 04/09/2013
Author: Markus Davey
Skype: markus.davey
Desc: Handles the movement of all the map markers for vehicles.
Iterates through the entire vehicle array for the player's team, and displays their map markers.
Is run by the client main loop, with a very low priority.
Changes of vehicle's icons are handled by the onDeathEH for the vehicle. The vehicle's entry would be changed, thus changing it's icon.
Eventually, when the vehicle is garbage collected, the marker will be deleted automatically, as part of this script. It will also be removed from the array after 10 seconds, to ensure no ghost markers remain.
ELSE I create a call to the client to force delete it instantly, whilst deleting it from the array at the same time. (Whichever works)
Return: N/A
*/

//private [];

{
	private ['_markerName', '_netID', '_type', '_netIDObject'];
	_netID = _x select 0;
	_type = _x select 1;
	_netIDObject = objectFromNetId _netID;
	
	_markerName = format ["%1_%2", Client_PlayerSideStr, _netID];
	
	// -- Check if vehicle exists
	if (isNull _netIDObject) exitwith 
	{ // -- If null, delete the marker.
		deleteMarkerLocal _markerName;
	};
	
	// -- Check to see if marker already exists, else create it
	if ((getMarkerColor _markerName) == "") exitWith
	{ // -- TODO move to specialised 'clientCreateMarker' function, maybe
		_markerName = createMarkerLocal [_markerName, _netIDObject];
		_markerName setMarkerShapeLocal 'ICON';
		_markerName setMarkerTypeLocal 'mil_dot';
		_markerName setMarkerTextLocal _type;
	};
	
	// -- Else, update the marker's position.
	_markerName setMarkerPosLocal (getPosATL _netIDObject);
	
} foreach call compile format ["MV_Netvar_%1VEHICLES", Client_PlayerSideStr];