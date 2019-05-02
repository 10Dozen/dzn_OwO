/* ----------------------------------------------------------------------------
Function: dzn_OwO_fnc_switchUniform

Description:
	Switches uniform, but saves stored items.

Parameters:
	_unit -- target unit <OBJECT>
	_class -- new item class <STRING>

Returns:
	_result -- is item changed <BOOL>

Examples:
    (begin example)
		_result = [player, _class] call dzn_OwO_fnc_switchUniform;
    (end)

Author:
	10Dozen
---------------------------------------------------------------------------- */

#include "..\macro.hpp"

if (isNil SVAR(fnc_addWeaponViaCrutches)) then {
	/*	
		Code below should be replaced 
		by addWeaponWithAttachmentsCargo (https://community.bistudio.com/wiki/addWeaponWithAttachmentsCargo) command once released (v1.93)!
	*/
	GVAR(fnc_addWeaponViaCrutches) = {
		params ["_container", "_weaponData"];
		_weaponData params ["_weaponInfo", "_weaponCount"];
		private _class = _weaponInfo # 0;
		_weaponInfo deleteAt 0;

		private "_u";

		if (isNil { player getVariable SVAR(ContainerLoader) }) then {
			_u = (createGroup civilian) createUnit ["C_man_1",position _container,[],0,"CAN_COLLIDE"];
			_u hideObjectGlobal true;
			_u disableCollisionWith player;
			_u allowDamage false;
			_u disableAI "ANIM";
			_u switchMove "amovppnemstpsnonwnondnon";
			_u disableAI "ALL";

			_u addEventHandler ["Put", { (_this select 0) setPos [0,0,0]; }];

			player setVariable [SVAR(ContainerLoader), _u];
		} else {
			_u = player getVariable SVAR(ContainerLoader);
			_u setPos (position _container);
		};

		for "_i" from 1 to _weaponCount do {
			_u addWeapon _class;
			{ _u addWeaponItem [_class, _x]; } forEach _weaponInfo;
			_u action ["DropWeapon",_container,_class];
		};
	};
};

params ["_unit", "_class"];

if ((uniform player) isEqualTo "") exitWith { false };

private _uniformLoadout = (getUnitLoadout _unit) # 3 # 1; 
player forceAddUniform _class;

{
	if (count _x > 2) then {
		// Magazine , e.g. ["30Rnd_65x39_caseless_mag",1,30]
		_x params ["_itemClass", "_count", "_ammo"];
		for "_i" from 1 to _count do { _unit addMagazine [_itemClass, _ammo]; };

	} else {
		if (typename (_x # 0) == "STRING") then {
			// Item  , e.g. ["FirstAidKit",1]
			_x params ["_itemClass", "_count"];
			for "_i" from 1 to _count do { _unit addItemToUniform _itemClass; };

		} else {
			// Weapon , e.g. [["hgun_P07_F","","","",[],[],""],1]
			[uniformContainer player, _x] call GVAR(fnc_addWeaponViaCrutches);
			if (vehicle player != player) then { systemChat "[dzn OWO]: Weapon in uniform will be displayed once you leave the vehicle!"; };

		};	
	};
} forEach _uniformLoadout;

(true)
