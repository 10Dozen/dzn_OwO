/* ----------------------------------------------------------------------------
Function: dzn_OwO_fnc_uiHandleInventoryDropdownClick

Description:
	Handles inventory dropdown button click

Parameters:
	_ctrlType -- control type ("UNIFROM", "HEADGEAR", etc.) <STRING>
	_class -- class assosiated with clicked button <STRING>
	_descText -- description text assosiated with clicked button <STRING>

Returns:
	none

Examples:
    (begin example)
		[_ctrlType, _class, _descText] call dzn_OwO_fnc_uiHandleInventoryDropdownClick;
    (end)

Author:
	10Dozen
---------------------------------------------------------------------------- */

#include "..\macro.hpp"

params ["_ctrlType", "_class", "_descText"];

[] spawn GVAR(fnc_uiHideInventoryDropdownItems);

private _result = false;
private _itemCategory = "";

switch (toUpper _ctrlType) do {
	case "UNIFORM": {
		_itemCategory = localize "STR_OwO_HintUniform";
		_result = [player, _class] call GVAR(fnc_switchUniform);
	};
	case "HEADGEAR": {
		_itemCategory = localize "STR_OwO_HintHeadgear";
		_result = [player, _class] call GVAR(fnc_switchHeadgear);
	};
	case "GOGGLES": {
		_itemCategory = localize "STR_OwO_HintGoggles";
		_result = [player, _class] call GVAR(fnc_switchGoggles);
	};
	case "POINTER": {
		_itemCategory = localize "STR_OwO_HintPointer";
		_result = [player, _class] call GVAR(fnc_switchPointer);
	};
};

if (_result) then { 
	hint format ["%1 %2: %3", _itemCategory, localize "STR_OwO_HintChange", _descText];
	[] spawn GVAR(fnc_cachePlayerItemData);
};