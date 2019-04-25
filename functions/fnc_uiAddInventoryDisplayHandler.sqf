/* ----------------------------------------------------------------------------
Function: dzn_OwO_fnc_uiAddInventoryDisplayHandler

Description:
	Adds inventory dialog opening/closing handler and executes some code once opened

Parameters:
	none

Returns:
	none

Examples:
    (begin example)
		[] spawn dzn_OwO_fnc_uiAddInventoryDisplayHandler;
    (end)

Author:
	10Dozen
---------------------------------------------------------------------------- */

#include "..\macro.hpp"
#define INV_DISPLAY (findDisplay 602)
#define INV_CTRL(X)	(INV_DISPLAY displayCtrl X)
#define UNIFORM_CTRL INV_CTRL(6331)
#define HEADGEAR_CTRL INV_CTRL(6240)
#define GOGGLES_CTRL INV_CTRL(6216)

/*
6381, // vest
6191, // backpack
6240 // headgear
610, // Primary Weapon
620, // PW Muzzle
621, // PW Optics
622, // PW Flashlight
611, // secondary weapon
612, // hand Gun
630, // HG Flashlight
628, // HG Muzzle
629 // HG Optics
*/

if (!isNil SVAR(handleInventory)) exitWith {}; // Prevent double handler

GVAR(handleInventory) = true;
while { GVAR(handleInventory) } do {
	// Wait until inventroy UI is opened 
	waitUntil { sleep 0.25; !isNull INV_DISPLAY };

	// Add handler for inventory slots 
	{
		_x params ["_ctrl", "_type"];

		_ctrl ctrlAddEventHandler [
			"MouseButtonDblClick"
			, format ["[_this, ""%1""] spawn %2", _type, SVAR(fnc_uiShowOptions)]
		];
	} forEach [
		 [UNIFORM_CTRL, "UNIFORM"]
		,[HEADGEAR_CTRL, "HEADGEAR"]
		,[GOGGLES_CTRL, "GOGGLES"]
	];

	// Hide dropdown on click anywhere outside dropdown
	{
		_x ctrlSetEventHandler ["MouseButtonClick", "[] call " + SVAR(fnc_uiHideInventoryDropdownItems)];
	} forEach allControls INV_DISPLAY;

	waituntil { sleep 0.25; isNull INV_DISPLAY };
};