/* ----------------------------------------------------------------------------
Function: dzn_OwO_fnc_uiAddInventoryDropdownItem

Description:
	Draws clickable control (button) over inventory screen

Parameters:
	_text -- display text <STRING>
	_expression -- code to execute on click (will be executed in missionNamespace) <CODE>
	_args -- arguments for code (refered as _args in expression) <ANY>
	_isEnabled -- flag to enable control <BOOL>
	_x -- control position X <NUMBER>
	_y -- control position Y <NUMBER>
	_w -- (optional) control width (default: 0.15) <NUMBER>
	_h -- (optional) control height (default: 0.01) <NUMBER>
	_tileStyle -- (optional) background color RGBA (default: [0,0,0,0.7]) <ARRAY>
	_textStyle -- (optional) text styling in format [RGBA, FontFamily, FontSize] (default: [[1,1,1,1], "PuristaLight", 0.04]) <ARRAY>

Returns:
	_control -- create control <CONTROL>

Examples:
    (begin example)
		_ctrlButton = [
			"Show Hint"
			, { hint str[_args]; }
			, ["Unpack", "Some hind text", "Another text"]
			, true
			, 0.5, 0.45
			, 0.15, 0.05
		] call dzn_OwO_fnc_uiAddInventoryDropdownItem;
    (end)

Author:
	10Dozen
---------------------------------------------------------------------------- */

#include "..\macro.hpp"

#define INV_DISPLAY (findDisplay 602)
#define INV_IDC -1

params [
	"_text"
	,"_expression"
	,"_args"
	,["_isEnabled", true]
	,"_x"
	,"_y"
	,["_w", 0.15]
	,["_h", 0.05]
	,[ "_tileStyle", [0,0,0,0.7] ]
	,[ "_textStyle", [[1,1,1,1], "PuristaLight", 0.04] ]
];

private _dialog = INV_DISPLAY;
private _ctrlId = INV_IDC;
private _item = _dialog ctrlCreate ["RscButtonMenuOK", -1];

_item ctrlSetPosition [_x, _y, _w, _h];	
_item ctrlSetStructuredText parseText _text;
_item ctrlSetBackgroundColor _tileStyle;
_item ctrlSetTextColor (_textStyle select 0);
_item ctrlSetFont (_textStyle select 1);
_item ctrlSetFontHeight (_textStyle select 2);

_item ctrlSetEventHandler [
	"ButtonClick"
	, format[ 
		"with missionNamespace do {
			private _args = %2;
			%1
		}"
		, str(_expression) select [1, count str(_expression)-2]
		, _args
	]
];

_item ctrlEnable _isEnabled;	
_item ctrlCommit 0;

(_item)