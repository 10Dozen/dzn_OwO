/* ----------------------------------------------------------------------------
Function: dzn_OwO_fnc_uiAddInventoryDisplayHandler

Description:
	Adds inventory dialog opening/closing handler and executes some code once opened

Parameters:
	_mode -- (optional) execution mode ("INIT" (Default), "RESET", "ADD_HANDLERS", "UPDATE") <STRING> 
	_data -- (optional) mode specific data <ANY>

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
#define POINTER_CTRL INV_CTRL(622)

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

params [
	["_mode", "INIT"]
	,["_data",[]]
];

switch (toUpper _mode) do {
	case "INIT": {
		
		if (!isNil SVAR(handleInventory)) exitWith {};

		GVAR(handleInventory) = true;
		GVAR(inventoryEH) = player addEventHandler [
			"InventoryOpened"
			,{ ["ADD_HANDLERS"] spawn GVAR(fnc_uiAddInventoryDisplayHandler); }
		];

		GVAR(inventoryClosedEH) = player addEventHandler [
			"InventoryClosed"
			,{ ["RESET"] spawn GVAR(fnc_uiAddInventoryDisplayHandler); }
		];

	};

	case "ADD_HANDLERS": {
		waitUntil { !isNull INV_DISPLAY };

		// Hide dropdown on click anywhere outside dropdown
		{
			_x ctrlSetEventHandler [
				"MouseButtonClick"
				, format ["['UPDATE'] call %1;", SVAR(fnc_uiHideInventoryDropdownItems)]
			];
		} forEach allControls INV_DISPLAY;

		[{
			params ["", "_handle"];

			if (!isNull INV_DISPLAY) then {
				["UPDATE"] call GVAR(fnc_uiAddInventoryDisplayHandler);
			} else {
				_handle call CBA_fnc_removePerFrameHandler;
			};
		}, 0.2, []] call CBA_fnc_addPerFrameHandler;

		["UPDATE"] call GVAR(fnc_uiAddInventoryDisplayHandler);
	};

	case "UPDATE": {

		[] call GVAR(fnc_cachePlayerItemData);

		{
			_x params ["_ctrl", "_type", "_available"];

			(uiNamespace getVariable [format [SVAR(Inventory_Items_%1), _type], [-1, controlNull]]) params ["_ctrlEH","_ctrlIcon"];

			if (_available) then {
				if (_ctrlEH < 0) then {
					// Add EH if not exists yet
					_ctrlEH = _ctrl ctrlAddEventHandler [
						"MouseButtonDblClick"
						, format ["[_this, ""%1""] spawn %2;", _type, SVAR(fnc_uiShowOptions)]
					];
				};

				if (isNull _ctrlIcon) then {
					// Add 'Option available' Icon if none
					private _ctrlPos = (ctrlPosition _ctrl);
					_ctrlIcon = [
						"",{},[],false
						,(_ctrlPos # 0),(_ctrlPos # 1),(safeZoneH / 100),(safeZoneW / 100)
						,["GUI","BCG_RGB"] call BIS_fnc_displayColorGet
					] call GVAR(fnc_uiAddInventoryDropdownItem);

				};
		
				uiNamespace setVariable [format [SVAR(Inventory_Items_%1), _type], [_ctrlEH, _ctrlIcon]];
			} else {
				if (_ctrlEH >= 0) then { _ctrl ctrlRemoveEventHandler ["MouseButtonDblClick", _ctrlEH]; };
				if (!isNull _ctrlIcon) then { ctrlDelete _ctrlIcon; };

				uiNamespace setVariable [format [SVAR(Inventory_Items_%1), _type], nil];
			};
		} forEach [
			 [UNIFORM_CTRL, "UNIFORM", GVAR(uniformOptionsAvailable)]
			,[HEADGEAR_CTRL, "HEADGEAR", GVAR(headgearOptionsAvailable)]
			,[GOGGLES_CTRL, "GOGGLES", GVAR(gogglesOptionsAvailable)]
			,[POINTER_CTRL, "POINTER", GVAR(pointerOptionsAvailable)]
		];
	};
	
	case "RESET": {
		{
			uiNamespace setVariable [format [SVAR(Inventory_Items_%1), _x], nil];
		} forEach ["UNIFORM","HEADGEAR","GOGGLES","POINTER"];
	};
	
};

(true)