
if (!hasInterface) exitWith {};

#include "macro.hpp"

call compile preprocessFileLineNumbers format ["%1\bundleTable.sqf", PATH];
call compile preprocessFileLineNumbers format ["%1\functions.sqf", PATH];
// call compile preprocessFileLineNumbers format ["%1\Settings.sqf", PATH];

[] spawn {
	// Cache bundle data
	[] spawn GVAR(fnc_cacheBundleData);

	waitUntil { time > 0 && local player };

	// Start Inventory screen handler
	[] spawn GVAR(fnc_uiAddInventoryDisplayHandler);
};