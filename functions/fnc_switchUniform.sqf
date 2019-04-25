/* ----------------------------------------------------------------------------
Function: dzn_OwO_fnc_switchUniform

Description:
	Switches uniform, but saves stored items.

Parameters:
	_unit -- target unit <OBJECT>
	_class -- new item class <STRING>

Returns:
	_result -- is item changed <BOOL>

Examples:
    (begin example)
		_result = [player, _class] call dzn_OwO_fnc_switchUniform;
    (end)

Author:
	10Dozen
---------------------------------------------------------------------------- */

#include "..\macro.hpp"

params ["_unit", "_class"];

if ((uniform player) isEqualTo "") exitWith { false };

private _uniformLoadout = (getUnitLoadout _unit) # 3 # 1; 
player forceAddUniform _class;

{
	_x params ["_itemClass", "_count", ["_ammo", -1]];
	
	if (_ammo >= 0) then {
		for "_i" from 1 to _count do { 
			_unit addMagazine [_itemClass, _ammo];
		};
	} else {
		for "_i" from 1 to _count do { 
			_unit addItemToUniform _itemClass;
		};
	};
} forEach _uniformLoadout;

(true)