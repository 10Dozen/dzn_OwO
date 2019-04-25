/* ----------------------------------------------------------------------------
Function: dzn_OwO_fnc_cacheBundleData

Description:
	Creates cache of bundle data

Parameters:
	none

Returns:
	none

Examples:
    (begin example)
		[] spawn dzn_OwO_fnc_cacheBundleData;
    (end)

Author:
	10Dozen
---------------------------------------------------------------------------- */

#include "..\macro.hpp"

GVAR(BundleCache) = call CBA_fnc_createNamespace;
GVAR(ItemCache) = call CBA_fnc_createNamespace;

{
	{
		_x params ["_class", "_bundle"];

		// Add bundle option
		private _bundleOptions =  GVAR(BundleCache) getVariable _bundle;
		if (isNil { _bundleOptions }) then {
			GVAR(BundleCache) setVariable [_bundle, [_x]];
		} else {
			_bundleOptions pushBack _x;
		};

		// Add item option 
		GVAR(ItemCache) setVariable [_class, _bundle];
	} forEach _x;
} forEach [
	  GVAR(Uniforms)
	, GVAR(Headgear)
	, GVAR(Accessories)
];