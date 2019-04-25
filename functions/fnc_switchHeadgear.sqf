/* ----------------------------------------------------------------------------
Function: dzn_OwO_fnc_switchHeadgear

Description:
	Switches headgear

Parameters:
	_unit -- target unit <OBJECT>
	_class -- new item class <STRING>

Returns:
	_result -- is item changed <BOOL>

Examples:
    (begin example)
		_result = [player, _class] call dzn_OwO_fnc_switchHeadgear;
    (end)

Author:
	10Dozen
---------------------------------------------------------------------------- */

#include "..\macro.hpp"

params ["_unit", "_class"];

if ((headgear player) isEqualTo "") exitWith { false };

player addHeadgear _class;

(true)