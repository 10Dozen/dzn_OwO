/* ----------------------------------------------------------------------------
Function: dzn_OwO_fnc_switchGoggles

Description:
	Switches goggles

Parameters:
	_unit -- target unit <OBJECT>
	_class -- new item class <STRING>

Returns:
	_result -- is item changed <BOOL>

Examples:
    (begin example)
		_result = [player, _class] call dzn_OwO_fnc_switchGoggles;
    (end)

Author:
	10Dozen
---------------------------------------------------------------------------- */

#include "..\macro.hpp"

params ["_unit", "_class"];

if ((goggles player) isEqualTo "") exitWith { false };

player addGoggles _class;

(true)