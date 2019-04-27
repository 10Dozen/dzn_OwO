/* ----------------------------------------------------------------------------
Function: dzn_OwO_fnc_uiShowOptions

Description:
	Handles double click on inventory control.

Parameters:
	_eh - event handler data <ARRAY>
	_ctrlType - control type ("UNIFROM", "HEADGEAR", etc.) <STRING>

Returns:
	none

Examples:
    (begin example)
		[_eh, "UNIFORM"] spawn dzn_OwO_fnc_uiShowOptions;
    (end)

Author:
	10Dozen
---------------------------------------------------------------------------- */

#include "..\macro.hpp"

params ["_ehData", "_ctrlType"];
_ehData params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];

// Get options 
private _item = switch (toUpper(_ctrlType)) do {
	case "UNIFORM": { uniform player };
	case "HEADGEAR": { headgear player };
	case "GOGGLES": { goggles player };
};

private _options = [_item] call GVAR(fnc_getItemOptions);
if (_options isEqualTo []) exitWith { /* No options */ hint "No options for item"; };

// Draw dropdown
private _ctrlPos = (ctrlPosition _control);
private _xPosSide = (_ctrlPos # 0) + (_ctrlPos # 2);

[] call GVAR(fnc_uiHideInventoryDropdownItems);

{
	_x params ["_class", "", ["_displayText", "CHNG"], ["_descText", "CHNG_"]];

	uiNamespace setVariable [
		format[SVAR(Inventory_DropdownItem_%1), _forEachIndex]
		, [
			_displayText call GVAR(fnc_getTextByShortcut)
			, { _args call GVAR(fnc_uiHandleInventoryDropdownClick); }
			, [_ctrlType, _class, _descText call GVAR(fnc_getTextByShortcut)]
			, true
			, _xPos max _xPosSide, _yPos, 0.3, 0.05
		] call GVAR(fnc_uiAddInventoryDropdownItem)
	];

	_yPos = _yPos + 0.05;
} forEach _options;

uiNamespace setVariable [SVAR(Inventory_DropdownItem_Max), (count _options) - 1];
