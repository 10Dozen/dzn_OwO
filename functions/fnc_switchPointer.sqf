/* ----------------------------------------------------------------------------
Function: dzn_OwO_fnc_switchPointer

Description:
	Switches pointer

Parameters:
	_unit -- target unit <OBJECT>
	_class -- new item class <STRING>

Returns:
	_result -- is item changed <BOOL>

Examples:
    (begin example)
		_result = [player, _class] call dzn_OwO_fnc_switchPointer;
    (end)

Author:
	10Dozen
---------------------------------------------------------------------------- */

#include "..\macro.hpp"

params ["_unit", "_class"];

private _pointer = (player weaponAccessories (primaryWeapon player)) # 1;

if (_pointer isEqualTo "") exitWith { false };

player addPrimaryWeaponItem _class;

(true)