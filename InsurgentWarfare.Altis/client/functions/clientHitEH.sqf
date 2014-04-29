/* clientHitEH script
Created: 04/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Processes events where the player is hit.
*/

private ['_hitee', '_hiter', '_dmg'];

_hitee = _this select 0;
_hiter = _this select 3;
_dmg = _this select 2;

// Return
_this select 2;