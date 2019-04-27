
if (!hasInterface) exitWith {};

#include "macro.hpp"

call compile preprocessFileLineNumbers format ["%1\bundleTable.sqf", PATH];
call compile preprocessFileLineNumbers format ["%1\functions.sqf", PATH];
// call compile preprocessFileLineNumbers format ["%1\Settings.sqf", PATH];

[] spawn {
	// Cache bundle data
	[] spawn GVAR(fnc_cacheBundleData);

	waitUntil { time > 0 && local player };

	GVAR(uniformCached) = "";
	GVAR(headgearCached) = "";
	GVAR(gogglesCached) = "";

	GVAR(uniformOptionsAvailable) = false;
	GVAR(headgearOptionsAvailable) = false;
	GVAR(gogglesOptionsAvailable) = false;

	[] spawn GVAR(fnc_cachePlayerItemData);

	// Start Inventory screen handler
	[] spawn GVAR(fnc_uiAddInventoryDisplayHandler);
};