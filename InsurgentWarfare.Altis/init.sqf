/* init.sqf script
Created: 02/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: If it's a server and dedicated, it'll only run the serverInit. If the server is not dedicated, the client init will also run. 
If it's not a server, it's a client and runs the clientInit.
Return:
*/

if (isServer) then 
{ 
    //if (!isDedicated) exitwith {titleText ["NOTE: HOSTING AS A HOST CLIENT WILL NOT WORK WITH THIS MISSION. RUNNING LIKE THIS BREAKS MANY FEATURES AND SO THUS IS PURPOSEFULLY DISABLED.", "BLACK FADED", 4096];}; // 'server' is a client hosting the mission. Run both main loops. 
	if (!isDedicated) then {execVM "client\clientInit.sqf";};
    execVM "server\serverInit.sqf"; // -- TODO remove this, and reinstate the above. Debugging only.
};

if (!isServer) then {
    execVM "client\clientInit.sqf";
};