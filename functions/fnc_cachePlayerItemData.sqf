/* ----------------------------------------------------------------------------
Function: dzn_OwO_fnc_cachePlayerItemData

Description:
	Creates/Updates cache of players items

Parameters:
	none

Returns:
	none

Examples:
    (begin example)
		[] spawn dzn_OwO_fnc_cachePlayerItemData;
    (end)

Author:
	10Dozen
---------------------------------------------------------------------------- */

#include "..\macro.hpp"

// Uniform caching
private _uniform = uniform player;
if !(_uniform isEqualTo GVAR(uniformCached)) then {
	GVAR(uniformCached) = _uniform;
	private _uniformOptions = [_uniform] call GVAR(fnc_getItemOptions);
	GVAR(uniformOptionsAvailable) = !(_uniformOptions isEqualTo []);
	GVAR(uniformOptions) = _uniformOptions;
};

// Headgear caching 
private _headgear = headgear player;
if !(_headgear isEqualTo GVAR(headgearCached)) then {
	GVAR(headgearCached) = _headgear;
	private _headgearOptions = [_headgear] call GVAR(fnc_getItemOptions);
	GVAR(headgearOptionsAvailable) = !(_headgearOptions isEqualTo []);
	GVAR(headgearOptions) = _headgearOptions;
};

// Goggles caching 
private _goggles = goggles player;
if !(_goggles isEqualTo GVAR(gogglesCached)) then {
	GVAR(gogglesCached) = _goggles;
	private _gogglesOptions = [_goggles] call GVAR(fnc_getItemOptions);
	GVAR(gogglesOptionsAvailable) = !(_gogglesOptions isEqualTo []);
	GVAR(gogglesOptions) = _gogglesOptions;
};

(true)