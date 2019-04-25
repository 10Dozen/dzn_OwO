/* ----------------------------------------------------------------------------
Function: dzn_OwO_fnc_getItemOptions

Description:
	Return array of available options for item or [] if not available

Parameters:
	_itemClass -- classname of item to check <STRING>
	_exclude -- (optional) flag to exclude _itemClass from option list, true by default <BOOL>

Returns:
	_options -- array of options available (excluding _itemClass option) <ARRAY>

Examples:
    (begin example)
		_options = ["U_B_CTRG_1", true] call dzn_OwO_fnc_getItemOptions;
		// Returns:  [["U_B_CTRG_1","U_CTRG_1","F","F"],["U_B_CTRG_3","U_CTRG_1","R","R"],["U_B_CTRG_2","U_CTRG_1","NJ","NJ"]]
    (end)

Author:
	10Dozen
---------------------------------------------------------------------------- */

#include "..\macro.hpp"

params ["_itemClass", ["_exclude", true]];

_itemClass = toLower(_itemClass);
private _bundle = GVAR(ItemCache) getVariable _itemClass;
if (isNil {_bundle}) exitWith { [] }; // No cached bundle 

private _bundledOptions = +( GVAR(BundleCache) getVariable [_bundle, []] );

if (_exclude) then {
	// Remove option that contains _itemClass 
	{
		if (toLower(_x # 0) isEqualTo _itemClass) exitWith {
			_bundledOptions deleteAt _forEachIndex;
		};
	} forEach _bundledOptions;
};

(_bundledOptions)