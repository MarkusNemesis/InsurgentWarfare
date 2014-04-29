/* sharedInit script
Created: 01/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Initialises variables that are shared between the client and server namespaces.
*/

private ["_runTime", "_i"];
_runTime =+ time;

// Constants
PRIOR_RANGE = 8; // Dictates the valid ranges of event priorities

// -- Player slots
MV_Shared_PLAYERS_BLU = [];
MV_Shared_PLAYERS_OP = [];
MV_Shared_PLAYERS_IND = [];
MV_Shared_PLAYERS_CIV = [];

// -- Sides setup

// -- HQs
MV_Shared_CLASS_WEST_HQ = "B_Truck_01_covered_F";
MV_Shared_CLASS_WEST_HQ_Deployed = "Land_Cargo_HQ_V1_F";
//MV_Shared_WEST_HQ = objNull;
MV_Shared_CLASS_EAST_HQ = "O_Truck_02_covered_F";
MV_Shared_CLASS_EAST_HQ_Deployed = "Land_Cargo_HQ_V3_F";
//MV_Shared_EAST_HQ = objNull;

// -- Transport Trucks -- TODO convert these into arrays, and have the starting vehicles defined in another array. Reform 'spawn starting vehicles' script appropriately. ie all ambos is one array, all starting vehicles in another array, as class names.
MV_Shared_CLASS_WEST_TRUCK = "B_Truck_01_transport_F";
MV_Shared_CLASS_EAST_TRUCK = "O_Truck_02_transport_F";

// -- Ambulances
MV_Shared_CLASS_WEST_AMBO = "B_Truck_01_medical_F";
MV_Shared_CLASS_EAST_AMBO = "O_Truck_02_medical_F";

// -- Repair Trucks
MV_Shared_CLASS_WEST_REPAIR = [""];
MV_Shared_CLASS_EAST_REPAIR = [""];

// leave last
_runTime = time - _runTime;
diag_log format ["MV: sharedConstants INIT: FINISHED, Time taken: %1", _runTime];

/*

Structure ideas:

Concrete wall: Land_CncWall4_F OR Land_Mil_WallBig_4m_F
Ramps: Land_RampConcrete_F and Land_RampConcreteHigh_F
Razor wire: Land_Razorwire_F

Wind Turbines: Land_wpp_Turbine_V1_F and Land_wpp_Turbine_V2_F

BLUFORHQ Deployed: Land_Cargo_HQ_V1_F
OPFORHQ Deployed: Land_Cargo_HQ_V3_F

Truck Deployable MASH?: Land_Medevac_house_V1_F

*/