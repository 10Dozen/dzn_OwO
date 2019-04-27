#include "macro.hpp"

// Addon Settings

private _add = {
	params ["_var","_type","_val",["_exp", "No Expression"],["_subcat", ""],["_isGlobal", false]];	
	 
	private _arr = [
		FORMAT_VAR(_var)
		, _type
		, [LOCALIZE_FORMAT_STR(_var), LOCALIZE_FORMAT_STR_desc(_var)]		
		, if (_subcat == "") then { TITLE } else { [TITLE, _subcat] }
		, _val
		, _isGlobal
	];
	
	if !(typename _exp == "STRING" && { _exp == "No Expression" }) then { _arr pushBack _exp; };
	_arr call CBA_Settings_fnc_init;
};

[
	"Enabled"
	, "CHECKBOX"
	, true 
] call _add;

[
	"ApplyToVanilla"
	, "CHECKBOX"
	, true 
] call _add;

[
	"ApplyToCUP"
	, "CHECKBOX"
	, true 
] call _add;

[
	"ApplyToRHS"
	, "CHECKBOX"
	, true 
] call _add;

[
	"ExtraMappingSettings"
	, "EDITBOX"
	, "" 
	, { }
	/*
	, str(GVAR(Mapping)) select [1, count str(GVAR(Mapping)) -2]
	, { 
		GVAR(Mapping) = call compile ("[" + _this + "]");
		call GVAR(fnc_processMappingData);

		// Reset cache
		player setVariable [SVAR(FiredLastGunData), nil];
	}
	*/
] call _add;