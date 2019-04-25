/* ----------------------------------------------------------------------------
Function: dzn_OwO_fnc_configure

Description:
	Opens BIS arsenal with exteneded controls to grab data for OwO config.

Parameters:
	none

Returns:
	none

Examples:
    (begin example)
		[] spawn dzn_OwO_fnc_configure
    (end)

Author:
	10Dozen
---------------------------------------------------------------------------- */

#include "..\macro.hpp"

params [
	 ["_mode", "OPEN"]
	,["_data", []]
];

#define DISPLAY (uinamespace getvariable "RSCDisplayArsenal")
#define LIST_UNIFORM (DISPLAY displayCtrl 963)
#define LIST_HEADGEAR (DISPLAY displayCtrl 966)
#define LIST_GOGGLES (DISPLAY displayCtrl 967)


switch (toUpper _mode) do {
	case "OPEN": {
		["Open", true] call BIS_fnc_Arsenal;

		waitUntil { !isNull DISPLAY };

		{
			_x params ["_ctrl", "_type"];
			_ctrl ctrlAddEventHandler [
				"MouseButtonClick"
				, format [
					"%1 = '%2'; ['UPDATE_LABEL', '%2'] call %3"
					, SVAR(ArsenalTab)
					, _type
					, SVAR(fnc_configure)
				]
			];
		} forEach [
			[LIST_UNIFORM, "UNIFORM"]
			,[LIST_HEADGEAR, "HEADGEAR"]
			,[LIST_GOGGLES, "GOGGLES"]
		];

		// Adds new button control to arsenal UI
		private _itemLabel = DISPLAY ctrlCreate ["RscStructuredText",-1];
		_itemLabel ctrlSetPosition [0.125,0.9,0.25,0.05];
		_itemLabel ctrlSetBackgroundColor [0,0,0,0.7];
		_itemLabel ctrlSetStructuredText parseText "--- select item ---";
		_itemLabel ctrlCommit 0;

		private _bundleInput = DISPLAY ctrlCreate ["RscEdit", -1];
		_bundleInput ctrlSetPosition [0.375,0.9,0.25,0.05];
		_bundleInput ctrlSetBackgroundColor [0,0,0,0.7];
		_bundleInput ctrlSetTooltip "Bundle Name";
		_bundleInput ctrlCommit 0;

		private _textDropdown = DISPLAY ctrlCreate ["RscCombo", -1];
		_textDropdown ctrlSetPosition [0.625,0.9,0.25,0.05];
		_textDropdown ctrlSetBackgroundColor [0,0,0,0.7];
		_textDropdown ctrlSetTooltip "Assosiated display text";
		private _textDropdownItemID = 0;
		{ 
			if (_x select [count _x - 1] != "_" && _forEachIndex % 2 == 0) then {
				_textDropdown lbAdd (_x call GVAR(fnc_getTextByShortcut));
				_textDropdown lbSetData [_textDropdownItemID, _x];
				_textDropdownItemID = _textDropdownItemID + 1;
			};
		} forEach GVAR(StringShortcuts);
		_textDropdown lbSetCurSel 0;
		_textDropdown ctrlCommit 0;

		private _btn = DISPLAY ctrlCreate ["RscButton", -1];
		_btn ctrlSetText "EXPORT OWO CONFIG";
		_btn ctrlSetPosition [0.375,1,0.25,0.05];
		_btn ctrlCommit 0;

		_btn ctrlAddEventHandler ["ButtonClick", {
			params ["_control"];


			private _class = switch (GVAR(ArsenalTab)) do {
				case "UNIFORM": { uniform player };
				case "HEADGEAR": { headgear player };
				case "GOGGLES": { goggles player };
			};
			private _bundle = ctrlText (uiNamespace getVariable SVAR(ArsenalConfigBundleInput));
			private _dropdown = (uiNamespace getVariable SVAR(ArsenalConfigTextDropdown));
			private _data = _dropdown lbData (lbCurSel _dropdown);

			copyToClipboard str [_class, _bundle, _data, _data + "_"];

			_control ctrlSetText "COPYED";
			_control ctrlEnable false;
			_control ctrlCommit 0;
			
			[_control] spawn {
				params ["_control"];
				uiSleep 1.5;
				_control ctrlSetText "EXPORT OWO CONFIG";
				_control ctrlEnable true;
				_control ctrlCommit 0;
			};
		}];


		uiNamespace setVariable [SVAR(ArsenalConfigItemLabel), _itemLabel];
		uiNamespace setVariable [SVAR(ArsenalConfigBundleInput), _bundleInput];
		uiNamespace setVariable [SVAR(ArsenalConfigTextDropdown), _textDropdown];
		uiNamespace setVariable [SVAR(ArsenalConfigButton), _btn];
	};
	case "UPDATE_LABEL": {
		private _class = switch (_data) do {
			case "UNIFORM": { uniform player };
			case "HEADGEAR": { headgear player };
			case "GOGGLES": { goggles player };
		};
		(uiNamespace getVariable SVAR(ArsenalConfigItemLabel)) ctrlSetStructuredText (parseText format ["<t size='0.75' valign='bottom' align='center'>%1</t>", _class]);

		(true)
	};
};

