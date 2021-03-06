#include "macro.hpp"

call compile preprocessFileLineNumbers format ["%1\settings.sqf", PATH];

if (!hasInterface) exitWith {};
call compile preprocessFileLineNumbers format ["%1\bundleTable.sqf", PATH];
call compile preprocessFileLineNumbers format ["%1\functions.sqf", PATH];

[] spawn {
	waitUntil { GVAR(Enabled) };
	
	// Cache bundle data
	[] spawn GVAR(fnc_cacheBundleData);

	waitUntil { time > 0 && local player };

	GVAR(uniformCached) = "";
	GVAR(headgearCached) = "";
	GVAR(gogglesCached) = "";
	GVAR(pointerCached) = "";

	GVAR(uniformOptionsAvailable) = false;
	GVAR(headgearOptionsAvailable) = false;
	GVAR(gogglesOptionsAvailable) = false;
	GVAR(pointerOptionsAvailable) = false;

	[] spawn GVAR(fnc_cachePlayerItemData);

	// Start Inventory screen handler
	["INIT"] spawn GVAR(fnc_uiAddInventoryDisplayHandler);
};