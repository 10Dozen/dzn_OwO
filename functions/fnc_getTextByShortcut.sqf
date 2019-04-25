/* ----------------------------------------------------------------------------
Function: dzn_OwO_fnc_getTextByShortcut

Description:
	Returns full string for given shortcut or "" if not found

Parameters:
	_this -- shortcut text <STRING>

Returns:
	_displayText -- full text assosiated with shortcut <STRING>

Examples:
    (begin example)
		_displayText = "F" call dzn_OwO_fnc_getTextByShortcut;
    (end)

Author:
	10Dozen
---------------------------------------------------------------------------- */

#include "..\macro.hpp"

private _id = GVAR(StringShortcuts) find _this;

if (_id < 0) exitWith { "" };

private _displayText = GVAR(StringShortcuts) select (_id + 1);

(_displayText)