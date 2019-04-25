/* ----------------------------------------------------------------------------
Function: dzn_OwO_fnc_uiHideInventoryDropdownItems

Description:
	Deletes all displayed inventory dropdowns

Parameters:
	none 

Returns:
	none

Examples:
    (begin example)
		[] call dzn_OwO_fnc_uiHideInventoryDropdownItems;
    (end)

Author:
	10Dozen
---------------------------------------------------------------------------- */

#include "..\macro.hpp"

for "_i" from 0 to (uiNamespace getVariable [SVAR(Inventory_DropdownItem_Max), 0]) do {
	ctrlDelete (uiNamespace getVariable format [SVAR(Inventory_DropdownItem_%1), _i]);
};

uiNamespace setVariable [SVAR(Inventory_DropdownItem_Max), nil];

(true)