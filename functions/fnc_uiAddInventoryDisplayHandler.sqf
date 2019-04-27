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

params [["_mode", "INIT"]];

switch (toUpper _mode) do {
	case "INIT": {
		
		if (!isNil SVAR(handleInventory)) exitWith {};

		GVAR(handleInventory) = true;
		GVAR(inventoryEH) = player addEventHandler [
			"InventoryOpened"
			,{
				[] call GVAR(fnc_cachePlayerItemData);

				["ADD_HANDLERS"] spawn GVAR(fnc_uiAddInventoryDisplayHandler);
			}
		];

	};

	case "ADD_HANDLERS": {

		waitUntil { !isNull INV_DISPLAY };

		// Hide dropdown on click anywhere outside dropdown
		{
			_x ctrlSetEventHandler ["MouseButtonClick", "[] call " + SVAR(fnc_uiHideInventoryDropdownItems)];
		} forEach allControls INV_DISPLAY;

		// Add handler for inventory slots
		{
			_x params ["_ctrl", "_type", "_hasOptions"];

			if (_hasOptions) then {
				_ctrl ctrlAddEventHandler [
					"MouseButtonDblClick"
					, format ["[_this, ""%1""] spawn %2", _type, SVAR(fnc_uiShowOptions)]
				];

				private _ctrlPos = (ctrlPosition _ctrl);
				private _ctrlIcon = [
					"",{},[],false
					,(_ctrlPos # 0),(_ctrlPos # 1),(safeZoneH / 100),(safeZoneW / 100)
					,["GUI","BCG_RGB"] call BIS_fnc_displayColorGet
				] call GVAR(fnc_uiAddInventoryDropdownItem);
			};
		} forEach [
			[UNIFORM_CTRL, "UNIFORM", GVAR(uniformOptionsAvailable)]
			,[HEADGEAR_CTRL, "HEADGEAR", GVAR(headgearOptionsAvailable)]
			,[GOGGLES_CTRL, "GOGGLES", GVAR(gogglesOptionsAvailable)]
		];
	};

};

(true)